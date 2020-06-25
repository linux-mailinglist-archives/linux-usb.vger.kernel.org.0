Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F58620A4A5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 20:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390147AbgFYSTh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 14:19:37 -0400
Received: from mon2.sibername.com ([162.144.51.228]:60057 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389648AbgFYSTh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 14:19:37 -0400
X-Greylist: delayed 4234 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jun 2020 14:19:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:To:Subject:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0xyPDz+3OeDLsiiO3ZTTTnOCmECoAqB2q7/qMLo96mE=; b=C+rpLg6inVaSeQM+8J8oZ7SOrt
        kvXrAStES0sxn3kP/yHTlL7MqHS9WWtuwUfk0HuGcqOzOkZQ7r3NZQ3E8dA4aj8oB5oTF5OWoWaa0
        Pz3n/a+v4RRct4mIcwmB9KvU/Tn5h5l/aF4zAxA840c27r62MGUXyFtSTbeQdMKxdybFNSNQDGBhF
        k/P/PP/iQNUbYtzRFU6k143ZTuLFBEGpWQP88rw8thRbPhu8Rq/To7Uh2tvrZrFnn9Y9f51ThcdGA
        LG4CR8FTtNj91akvugi+xB3Q2uPRSxsfBrEJ8BBcZMm8HowWg4If58MxERd3WTJ/iYwg4BbmHRGyW
        YBhWmmkg==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:53902 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1joVMb-005UWG-8H
        for linux-usb@vger.kernel.org; Thu, 25 Jun 2020 13:08:54 -0400
From:   James <bjlockie@lockie.ca>
Subject: Alfa AWUS036ACM (Mediatek MT7612U) problem
To:     linux-usb <linux-usb@vger.kernel.org>
Message-ID: <59c96b05-2bdb-44d3-7371-6e5e05c20927@lockie.ca>
Date:   Thu, 25 Jun 2020 13:08:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have an Alfa AWUS036ACM (Mediatek MT7612U) on a Raspberry Pi 4. with:
OpenWrt SNAPSHOT r13626-751e6ab8e6 / LuCI Master git-20.175.45303-bb95e67
Kernel Version: 5.4.48

# lsusb
Bus 002 Device 002: ID 0e8d:7612 MediaTek Inc.

|My AP keeps dieing (I suspect when it's under load and some other 
condition :-(). mt76x2u 2-1:1.0: error: mt76x02u_mcu_wait_resp failed 
with -110| I tried:

https://superuser.com/questions/176319/hard-reset-usb-in-ubuntu-10-04

cd /sys/bus/usb/drivers/usb

echo 2-2 > unbind ; sleep 3 ; echo 2-2 > bind I think it should be 2-1 
so I tried that:

echo 2-1 > unbind ; sleep 3 ; echo 2-1 > bind

|[ 3539.309730] mt76x2u 2-1:1.0: firmware upload failed: -110
[ 3540.828260] mt76x2u: probe of 2-1:1.0 failed with error -5|
That didn't work.
Physically removing reinserting works (if I also "reset" the wifi in 
OpenWrt (I don't know what this does)).

There must be a way to remove/reinsert in software instead of rebooting.

