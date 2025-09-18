Return-Path: <linux-usb+bounces-27575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0DDB44ECF
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 09:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318443A8D1F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 07:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1755C2D47EF;
	Fri,  5 Sep 2025 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="peJi7NKG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEABA1B85F8
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056421; cv=none; b=U0hDBXxfo55qfvStsHMu0StJPwPmkvemKY0TXRZwmckGUWt+BJuCzPkNEjJN9y4IGk3wagLX8gqiihW7httc/Xzss/R7aQCZWf5ikiLgtBw2QwjlDRWlEiIAqQLKfprMfjv1bTOclqgsdXMotRcM41bZY8xEO2CS5vP7fLwsc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056421; c=relaxed/simple;
	bh=4Cfy4iuqk9/dPVlDVB5HT1Idv3NxiI7cRgHqe7XBxkY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VwVwx7KAsbN/CtLi9DMrY0JVGqyny34nboMdLakNMvN18Sz+3joCJ61ja5cCE8brnYWBQCC2oAzlG5y1VSTqKZcfCFkE7JEatNI7ZsbMZ4b9jek4YGH7u+V2oNIChVRarNRtgvEE0p0UUJSvLi2A3Fd80RolmYgikPaBJYPqX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=peJi7NKG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b046f6fb2a9so281249766b.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757056418; x=1757661218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7O8opwGpl1ITqT1mc56YpuAnvk0uxi1IiKUdTq+yIE=;
        b=peJi7NKGJKgb1DTeam2jpmO5geQVd6u6fofp/5M4IRrsGVZ1Z5WX0hT+j42mXDRfT8
         OxpZrQUHBYGSarYfm5E/twe+7oYqpRcMH47wV2toTK26vINQolFl2DOZvtq3kOF9L3Ht
         EsVF2iLvfa9gJR/lc5AuBcsNNbKMTZNkdxa65bjVKxf1DuKNdefsxzShQwQwrMzoOXKY
         Bn2MUm71YKXRmAbn+G4eO98U95/7tLDv4kg2Srb8qZTTvUVMEIHOWr4NNMdl2xPPBco4
         S+a0R38NLXBXa3/HA547h9hIYqVNkQNwk7G4PzvnEQVJHtXA6tx9MhjBAw1A9nbjNqJO
         ihsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757056418; x=1757661218;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7O8opwGpl1ITqT1mc56YpuAnvk0uxi1IiKUdTq+yIE=;
        b=oXSj7D3QgXHs7x9v4sdwXH+/p1KchLsdqCPeoxIdho7bi6XoNmScEHLytDGdVWObJf
         1lOQ68qO23b79YVIN36XdVTq2/a/Pjx4A5LaEsVeE+37y0nzRuUj2nvbDoWpFQN7IIIG
         1EiwJWmK7Kv4P7GIzyVT4B9EpXRGFp3elALrz13yLorYFMJqPvNl/18f1mxCx3aozYwv
         ZMf9PgizQjSfSbNVDp/vlk6HeKDawzswPbfZ+IuEzarLOuyhDBdgUiXOSJSuhPRW+Jiy
         AlRUtANXBRz2jRS94dpSD/We1clYUEyFWggi02ubemOpH+bDKM7RQ7ak4vJcZPvDzGgr
         RKKA==
X-Gm-Message-State: AOJu0Yx2g7JWSWX0dPcurxUNlqMDoh5bOwVc3jYigAWI9U/lU+4q5fag
	kZyU0q9gyEYrCgyR+718diRDKSoOrOT1f7eCHeM/YdPzCe2TUA5pXEyuUltN6TxFkFg=
X-Gm-Gg: ASbGncsrtYCIlLG5dYH25s9aKK6EAKfKT5BZfXE0k35CJL4j9tKlXOTrMSAXj1CAvZv
	TsJWZb2yYZCkuKXExeTC3emBD+Ht0pljZiuHBk2YagOjSCDA7E7psQkXstlA58ZaBwd8G+sEpyE
	76za4HCaPc3BEgRZy3wntKXPdV+Y/d2iR4hwGTtVrd2aPpMkcFJSsOtOBQ3vCwI2oiY3sRV3Xcd
	kI2KHO2FHrEbJqt6tDKHHa+cd6sHkxcDATfYQ6ew5hf1kdo7St/TOgySJVtpNfYkbvG4LNoUNBG
	7fEngj6C6Mf0kWC+Uyug5vPq9ydncg6Wa1mbvl8z4zP26YIsYRBdtemJoviqvTJyDT4C3isEg4E
	aVc2NjAaTmwHRjWG/4MjGHBcpsdixpczARhdVaZTTRDGYXz3pA1Wi6/g=
X-Google-Smtp-Source: AGHT+IGN10OuJQqOIsP8A72As17WV08I9Wcr3BGqorIsHUoOAy4v9RonEadxj5JXcGpFlvCOlFsSQg==
X-Received: by 2002:a17:907:170c:b0:b04:1f42:5de1 with SMTP id a640c23a62f3a-b041f42615emr1607531466b.42.1757056417790;
        Fri, 05 Sep 2025 00:13:37 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416e878a2sm1316704366b.95.2025.09.05.00.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:13:37 -0700 (PDT)
Message-ID: <199d5ced-e7ef-4109-8b1c-b3374db3e368@linaro.org>
Date: Fri, 5 Sep 2025 09:13:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
To: "Jayaraman, Venkat" <venkat.jayaraman@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 PSE Type-C Linux <pse.type-c.linux@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
 <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
 <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
 <b897d082-0d74-46fc-a0e4-7745347ba597@linaro.org>
 <CH0PR11MB5300AD8DD6BE6CBC799B49DD8000A@CH0PR11MB5300.namprd11.prod.outlook.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CH0PR11MB5300AD8DD6BE6CBC799B49DD8000A@CH0PR11MB5300.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 21:14, Jayaraman, Venkat wrote:
> Hi Neil,
> 
>> -----Original Message-----
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>> Sent: Monday, September 1, 2025 12:50 AM
>> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Jayaraman, Venkat <venkat.jayaraman@intel.com>; linux-usb@vger.kernel.org; gregkh@linuxfoundation.org; PSE Type-C Linux
>> <pse.type-c.linux@intel.com>; linux-arm-msm <linux-arm-msm@vger.kernel.org>
>> Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL command
>>
>> Hi,
>>
>> On 21/08/2025 09:21, Heikki Krogerus wrote:
>>> On Tue, Aug 19, 2025 at 11:47:58AM +0200, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 14/08/2025 18:30, Venkat Jayaraman wrote:
>>>>> Add support for UCSI READ_POWER_LEVEL command as per
>>>>> UCSI specification v2.1 and above to debugfs.
>>>>>
>>>>> Following power related fields will be exposed as files in debugfs:-
>>>>> peak_current (Peak current),
>>>>> avg_current (Average current) and
>>>>> vbus_voltage (VBUS voltage)
>>>>>
>>>>> These files will be updated either when a READ_POWER_LEVEL
>>>>> command is sent from OS or when a device is connected.
>>>>>
>>>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>>> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
>>>>> ---
>>>>> Changelog v3:
>>>>> - Rebased to kernel 6.17-rc1
>>>>>
>>>>> Changelog v2:
>>>>> - Removed extra space in declaration
>>>>> - Made the call to debugfs_create_file single line for clarity
>>>>>
>>>>>     drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
>>>>>     drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
>>>>>     drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
>>>>>     3 files changed, 60 insertions(+)
>>>>>
>>>>
>>>> This commit causes the following warning:
>>>> [    8.646179] ------------[ cut here ]------------
>>>> [    8.650986] Access to unsupported field at offset 0x59 (need version 0210)
>>>> [    8.651044] WARNING: drivers/usb/typec/ucsi/ucsi.c:1296 at ucsi_handle_connector_change+0x380/0x414 [typec_ucsi], CPU#0:
>> kworker/0:0/9
>>>> <snip>
>>>> [    8.832491] Hardware name: Qualcomm Technologies, Inc. SM8550 HDK (DT)
>>>> [    8.839228] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>>>> [    8.846084] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>>>> [    8.853277] pc : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
>>>> [    8.860031] lr : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
>>>> <snip>
>>>> [    8.944023] Call trace:
>>>> [    8.946570]  ucsi_handle_connector_change+0x380/0x414 [typec_ucsi] (P)
>>>> [    8.953328]  process_one_work+0x148/0x28c
>>>> [    8.957502]  worker_thread+0x2c8/0x3d0
>>>> [    8.961401]  kthread+0x12c/0x204
>>>> [    8.964759]  ret_from_fork+0x10/0x20
>>>> [    8.968474] ---[ end trace 0000000000000000 ]---
>>>>
>>>> on:
>>>> 8550-hdk:
>>>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253312#L1418
>>>> 8550-qrd:
>>>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253306#L1560
>>>> 8650-hdk:
>>>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253308#L1494
>>>> 8650-qrd:
>>>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253309#L1594
>>>> x1-crd:
>>>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253311#L2226
>>>> x1-qcp:
>>>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L2160
>>>>
>>>> I guess the version should be checked.
>>>
>>> Venkat, can you be prepare the fix for this?
>>>
>>> thanks,
>>>
>>
>> Gentle ping, can this be fixed ? Should I send a revert patch ?
>>
>> Neil
> 
> The Fix patch, for this warning, is ready and approved, can submit once the initial patch is merged.

Please post the fix, this broken patch is already on linux-next since Sun Aug 17:
https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next/+/c851b71fd6cdbf3000bf0a2354592a0f09db3ba3

Neil

> 
> Venkat
> 


