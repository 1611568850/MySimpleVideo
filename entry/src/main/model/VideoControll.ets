/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonConstants from '../ets/common/constants/CommonConstants';

/**
 * Get video string of current time.
 * @param the number of current time
 * @return the string of current time
 */
export function changeSliderTime(value: number): string {
    let second: number = value % CommonConstants.COMMON_NUM_MINUTE;
    let min: number = Number.parseInt((value / CommonConstants.COMMON_NUM_MINUTE).toString());
    let head = min < CommonConstants.COMMON_NUM_DOUBLE ? `${CommonConstants.ZERO_STR}${min}` : min;
    let end = second < CommonConstants.COMMON_NUM_DOUBLE ? `${CommonConstants.ZERO_STR}${second}` : second;
    let nowTime = `${head}${CommonConstants.SPLIT}${end}`;
    return nowTime;
}