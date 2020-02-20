Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880151669E4
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 22:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbgBTVdf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 16:33:35 -0500
Received: from mon1.sibername.com ([162.144.64.251]:46794 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgBTVdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 16:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=dPs+6B2ApbmZTgkD5tpf4XogMh9F0NVFslYPPI2B0I4=; b=XNL/eELCyz8q7Ik4Tepy52gdQa
        C8ouSKBppr7kS4T3hqRC7VUEWRZsnySDhe+skCSTl6t1BcCY/z1Ntt+m3Pm7AAlmQe8JddRFT+m5c
        saEbL1TNjDWVq6o5FhQ1kItTGZ3/53Ugt5/nlJUyvgykHi+peI+hQXjSWkvnNWLOcNQLPmw2gQcRK
        ADnMQuGOT9CmqWZzBa8KCLnde+UbiREuHvIX2PFQkO4QlCp6ZLVTAgfFAj27CeWbbVsXZAPvhJCqZ
        EsWzGv3AteISomeQO9LjnX7TiJDZtoYkNZpjqjl2x4hUR6/8pby+23/Q1vblq9t4Z/ZXRJnE//Y0F
        sPGa4kNg==;
Received: from 216-58-18-206.cpe.distributel.net ([216.58.18.206]:56854 helo=[192.168.1.17])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j4tRn-00A7Zq-KB; Thu, 20 Feb 2020 16:33:28 -0500
Subject: Re: USB questions
From:   James <bjlockie@lockie.ca>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002201015140.1453-100000@iolanthe.rowland.org>
 <0554a7bc-1e98-903d-58bb-a3c76d09d290@lockie.ca>
Message-ID: <409fc27a-c5c8-aad7-30e4-406c331396ff@lockie.ca>
Date:   Thu, 20 Feb 2020 16:33:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0554a7bc-1e98-903d-58bb-a3c76d09d290@lockie.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: rjl@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: rjl@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-02-20 4:29 p.m., James wrote:
>
>
> On 2020-02-20 10:23 a.m., Alan Stern wrote:
>> On Thu, 20 Feb 2020, Greg KH wrote:
>>
>> $ lsusb
>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>
>>>> 3. Shouldn't "Linux Foundation 3.0 root hub" be "Linux Foundation 3.1 Gen 1
>>>> root hub"?
>>> No, we don't say that from within the kernel.
>> But there's no reason we couldn't.  Greg, you could allocate a new
>> Product ID value for USB-3.1 root hubs and update lsusb to recognize
>> it.  (I don't know if it's worth including the "Gen 1" vs "Gen 2" part,
>> though.)
> The adata website for my flash drive says:
>> 2. Please note that USB 3.0, USB 3.1 Gen1, and USB 3.2 Gen1 are in 
>> fact the same specification and feature the same exact performance 
>> capabilities. The USB Implementers Forum (USB-IF) recently rebranded 
>> USB 3.1 Gen1 to USB 3.2 Gen1. For more information about the change, 
>> please visit the USB-IF website at www.usb.org <https://www.usb.org/>.
> That is one of the most confusing things I've read.

