Return-Path: <linux-usb+bounces-1073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B527B82B2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 16:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 67A8E2817C5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 14:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA31D154A6;
	Wed,  4 Oct 2023 14:51:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC3C8E2
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 14:51:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EAAAB
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696431101; x=1727967101;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/kzOYP/L41zYmHFXR3WYszLEueyjRxZC+LKpuGvgFFk=;
  b=j2j4MZkprsve/c3EnxLebOJg+Lz5xYVuXbNCKyOXexhQwN2Bw+zR7B7Z
   w1x2/7R0dm7xG4i7XSdDs2r+C6rgNLM/H0ODFhDuTfe3xunlStUqYZ1cu
   F5hdFkNjS1HqzhnDManal1mMx5MV2VdyvAujqphXFX+hP8u7Unj637SgB
   wJsdT0PmmmJoX1hRGoajZElk+P7t50Ch1izcIsP0jJShN4iXcUX2zmfhV
   KBTW5TlTCkQj2yhVwwmk6y4sRjv3E9uQhuB+yvKF731oCKv78GvxQ5w7C
   6+7u8HSSHDVi0hhT4galPC7Qn3V6hd//6/h/VkvQwez9geTzvLmTVAXqc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380462397"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="380462397"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 07:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701131748"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="701131748"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2023 07:51:38 -0700
Message-ID: <d1d449cd-6647-529d-33a9-0c8b171675d7@linux.intel.com>
Date: Wed, 4 Oct 2023 17:53:03 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2] usb: XHCI: Implement xhci_handshake_check_state() API
Content-Language: en-US
To: Udipto Goswami <quic_ugoswami@quicinc.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20230919085847.8210-1-quic_ugoswami@quicinc.com>
 <179abd6a-3c4e-456a-a946-1f8c7d715491@quicinc.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <179abd6a-3c4e-456a-a946-1f8c7d715491@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 3.10.2023 8.41, Udipto Goswami wrote:
> 
> 
> On 9/19/2023 2:28 PM, Udipto Goswami wrote:
>> In some situations where xhci removal happens parallel to
>> xhci_handshake, we enoughter a scenario where the
>> xhci_handshake will fails because the status does not change
>> the entire duration of polling. This causes the xhci_handshake
>> to timeout resulting in long wait which might lead to watchdog
>> timeout.
>>
>> The API  handles command timeout which may happen upon XHCI
>> stack removal. Check for xhci state and exit the handshake if
>> xhci is removed.
>>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v2: Fixed compilation error.
>>
...
> 
> Hi All,
> 
> Gentle Reminder on this.
> 

Thanks, added to queue

Modified the commit message a bit

-Mathias


