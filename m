Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC4622525F
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 17:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgGSPBU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 11:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgGSPBT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jul 2020 11:01:19 -0400
Received: from iam.tj (soggy.cloud [IPv6:2a01:7e00:e000:151::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9029CC0619D2
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2020 08:01:19 -0700 (PDT)
Received: from [IPv6:2a02:8010:4007::b92] (unknown [IPv6:2a02:8010:4007::b92])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 1B47E340AD;
        Sun, 19 Jul 2020 16:01:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1595170878; bh=XNDbvvzvFTJ1ldUQCeO3srN/8hHVjI57uck676id0sw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vJHlOxEerFZH/BE/oVp3SQxAQmdcY4r7fd8SJLFrXDRlTFlQbmk6HFo3DdhBVej4r
         FMFx5aFyXVduQJGOpswY47MnbBH3W9LsFuTJmRPzM8qT85N/BmFVYvauLxGOgI+z97
         nGhhTtYqmhZNdM6J1MDlWA7hwe8skL6vwGEF9NJm3ZA7QMpBtJzaSltbsiL7hUv4+M
         auNMY2T/ArzbanI68vw82g3U1gdL941L+DIK8Tm4xbXamjBSXGmdes/4NgDbWcxVNt
         eVpSABXeQVb58MOGcvpNcb6f2g7pxOPQW0i/NLP8SQlcUIfzV4nyXBI/zAXM5efJjr
         g7dCbiXwzl14g==
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6 inflight:
 IN
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
 <20200719143154.GA1200012@rowland.harvard.edu>
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Organization: Elloe CIC
Message-ID: <873b7b06-ae73-bd80-7dd8-54c811018587@elloe.vision>
Date:   Sun, 19 Jul 2020 16:01:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200719143154.GA1200012@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/07/2020 15:31, Alan Stern wrote:
> On Sun, Jul 19, 2020 at 11:22:10AM +0100, Tj (Elloe Linux) wrote:
>> With all kernels from 4.14 to 5.8.0-rc5 we're seeing failures with uas
>> on a Turris Mox aarch64 Marvell Armada 3720 that we don't see on amd64.
>>
>> The device that triggers them is:
>>
>> Bus 003 Device 002: ID 152d:0562 JMicron Technology Corp. / JMicron USA
>> Technology Corp.
>>
>> These are USB3<>NVME adapters with 256GB NVME attached.
>>
>> On advice from the Turris Mox developers we tried booting with and
>> without "pci=nomsi".
>>
>> We have other similar JMicron devices but they use usb-storage instead
>> and work fine.
>>
>> Linked below is the complete output from dmesg, lspci -vvnnk, lsusb -v
>> but here's a snapshot of the error messages:
> 
> Have you tried collecting a usbmon trace?  And in particular, have you 
> tried comparing it with a usbmon trace collected on the AMD64 system?
> 
> Alan Stern
> 
Not so far; We've just wrangled a Turris build system to build a vanilla
mainline kernel and Debian user-space. We'll tackle that this week.


