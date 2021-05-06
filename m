Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81341375057
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 09:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhEFHor (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 03:44:47 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:19601 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbhEFHoo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 03:44:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620287022; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=noICfXC6Ed7gAf3jFaQXxc3qdKEtR1x/cXg6VAU9bdOcO/TdLhEosR2kkSfvpRyFPC
    XeT8A3yjbHCqXCH6WrWp0zxqkfuA+bWaxVU/7L/Gefxq0JGmCA410OquYnBPGY6qHlZU
    ynGaUxi/UuNw7eCtmPQ89dCTwMxVnbEHTY4KP7H0eegokBt29dXEYa4Uy33mUFJFMRYt
    /oU022SiSdYtXv2EPj+URtoEm8t9UYx6d5/GGMoYkBn9093nHvFWYS4rYzxCLQN/ScMw
    k6wnhgaJVee46W+Ud+JmYC3QqIVm/nlNGaEO84Za5sIA95Ob3w/zVSKKvb6SJN9oGPsx
    dS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620287022;
    s=strato-dkim-0002; d=strato.com;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=tI62NvMubv38i8NcbLEix2i9AqFhoHfFRi5CDyF2tqA=;
    b=ssqmrY1W0FA0cLIjQQw6LuRk3Ch2B8MImPwypdPF9EguvQyH/pdeYT3nShS1mTwdD0
    KoTVN4pWmIdChHp2snqQnMoHzBbGNbHFDQkbUf4YfRxFIqUja+29C7u87Yhs9yhqO8i3
    fKmVQsVgj4J7b+UMMVmPmn3G0AMemOIF3ZYxpH3Q+e48Zq0U2Xmqeo6A2t41Zx59wntv
    EP5NlZx0O4QHkYktAKcAKja92bJvfthNpfq7MIKWs2rIZeFwI8VCkp0QRSB/do3Stk99
    cSLCvleorwCVbBkjnP1uTrdUrhv+rpybt5Nq8KgX48ub/bUjdNT/qOKtU95Ok57tuF77
    d/Rg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620287022;
    s=strato-dkim-0002; d=woltersonline.net;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=tI62NvMubv38i8NcbLEix2i9AqFhoHfFRi5CDyF2tqA=;
    b=a10kLAEaX48MK9TNRfMSAVFUfh1kmbTKT6NxxNZjtUefOHxv/BaIbqDf5WGKggeaCT
    coczlLbxxl3syPj8NOKSJPESJm9IOsuBMaDDAmmokXNRnhqqQA+P1GfqdXjiGhI1e2SB
    IPjpnbw6zpMBq01BL+b9Rn+Ghv4KFnphSYP799zaIscYcr5ySGhj06r1d4upwOPt1R2X
    JltJiWH2oOP67Z/2vuAFoY5xabfKBhhl+Rwv7owZ9GS4LpOxXXfIJquKhj2+GB2fEEdn
    0XWP3860lAtl2Y3fXGkMdPiA4n3ucwbDDR5+fFMpfqU0BZUMpTvzKEZyeQe9vRGS9DPM
    EYxw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":PmMGcFK8W+iThef0QhYq5H6NV6kE4K87ZlTeLyeqymu1mQeG9z7rBMC2G76s35j7/KPYpAPwS/9Bm81svZu3ta56r/F5SfH125qLX2lZ53lqvQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c9:8f3f:9c4b:7388:7555:8c56:b420]
    by smtp.strato.de (RZmta 47.25.6 AUTH)
    with ESMTPSA id Y08733x467hg3AB
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 6 May 2021 09:43:42 +0200 (CEST)
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org
From:   Robert Wolters <robert@woltersonline.net>
Subject: set custom baud-rate for SCS P4 Dragon
Message-ID: <c964941a-a04a-7402-597c-d0bce15de5d7@woltersonline.net>
Date:   Thu, 6 May 2021 09:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

|Why: FTDI USB serial speed issue with SCS P4 Dragon short-wave modems, 
a custom baud-rate is required Solution: set special baud-rate by 
setting a custom divisor on 38400B Signed-off-by: Robert Wolters 
<robert@woltersonline.net> | ||--- ftdi_sio.c 2021-04-21 
13:01:00.000000000 +0200| ||+++ ftdi_sio.c 2021-04-26 18:53:00.819175707 
+0200| ||@@ -97,6 +97,7 @@| |||static int ftdi_8u2232c_probe(struct 
usb_serial *serial);| ||static void ftdi_USB_UIRT_setup(struct 
ftdi_private *priv);||||static void ftdi_HE_TIRA1_setup(struct 
ftdi_private *priv);| |+static void ftdi_SCS_DR7X00_setup(struct 
ftdi_private *priv);| ||static const struct ftdi_sio_quirk 
ftdi_jtag_quirk = {| |||.probe  = ftdi_jtag_probe,| |||@@ -122,6 +123,10 
@@| |||.probe  = ftdi_8u2232c_probe,| |||}; ||||+static const struct 
ftdi_sio_quirk ftdi_SCS_DR7X00_quirk = {| |||+ .port_probe = 
ftdi_SCS_DR7X00_setup,| |||+};| |||+| |||/*| ||* The 8U232AM has the 
same API as the sio except for:| |* - it can support MUCH higher 
baudrates; up to:| |@@ -157,8 +162,12 @@| |{ USB_DEVICE(FTDI_VID, 
FTDI_EV3CON_PID) },| |{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_0_PID) },| 
|{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_1_PID) },| |- { 
USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) },| |- { 
USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },| |+ { 
USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) ,| |+ .driver_info = 
(kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },| |+ { USB_DEVICE(FTDI_VID, 
FTDI_SCS_DEVICE_3_PID) ,| |+ .driver_info = 
(kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },| |{ USB_DEVICE(FTDI_VID, 
FTDI_SCS_DEVICE_4_PID) },| |{ USB_DEVICE(FTDI_VID, 
FTDI_SCS_DEVICE_5_PID) },| |{ USB_DEVICE(FTDI_VID, 
FTDI_SCS_DEVICE_6_PID) },| |@@ -2296,6 +2305,15 @@| |priv->force_rtscts 
= 1;| |}| |+/* Setup for the SCS P4dragon DR-7X00 devices, which 
require| |+ *hardwired baud-rate of 829440 (38400 gets mapped to 829440) 
*/| |+static void ftdi_SCS_DR7X00_setup(struct ftdi_private *priv)| |+{| 
|+ priv->flags |= ASYNC_SPD_CUST;| |+ priv->custom_divisor = 29;| |+ 
priv->force_baud = 38400;| |+}| |+| |||||/*| |* Module parameter to 
control latency timer for NDI FTDI-based USB devices.| |* If this value 
is not set in /etc/modprobe.d/ its value will be set|

