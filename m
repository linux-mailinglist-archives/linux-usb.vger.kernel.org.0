Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF93F48CC21
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 20:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357412AbiALTkQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 14:40:16 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:42225 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356569AbiALTjW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 14:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fIpZdAI12RK+Nd6TXHz1uRa0jEh0MXzV+n+QdF+v1O4=; b=iFpfFVHcHRmL67ObCzG4DPvp1j
        UihMgjg+Rk0si85Ekyd5IWkHhuuFAsulscuFjXCRRMWPwu7YVPCJv0YMkNifiikfvpbk1LJpV61mS
        Y113RPYuBSeoMuD1ZtYicCgIxNOuHtYG1Me+ieaNp/BZOZkNLhZFFjZDU7J1KHbrsHRU383EQsGlq
        pMDh948lXgjXxpcwSAn6UklGMoDIM58C4rHWjTZy2OKJyu9IKeSYqJPUpZp+mRkklQTj2liJH11+j
        hI6/abYop1K3ZKO/qgMFMmuGSGHYVSzWrd1o+SiQl21MmQyBml1qSRk4SA3qcLjkcoEzGE0cDcP9X
        XER4xYKg==;
Received: from [66.79.250.116] (port=57076 helo=[192.168.68.65])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1n7jSs-0000Ly-8S
        for linux-usb@vger.kernel.org; Thu, 13 Jan 2022 06:39:21 +1100
Message-ID: <8855e8db-8913-d7e0-5b26-341bae5c5eee@lockie.ca>
Date:   Wed, 12 Jan 2022 14:39:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: problem with USB-C
Content-Language: en-US
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <830aa508-5c20-c7c9-5ba9-04bcf5ac7178@lockie.ca>
 <Yd59HLmparwNaok9@kroah.com> <Yd72gTFL0BsC7vtR@rowland.harvard.edu>
From:   James <bjlockie@lockie.ca>
In-Reply-To: <Yd72gTFL0BsC7vtR@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> Is that Seagate storage device really supposed to be USB-3.1?  It is
> connected at only USB-2 speed!  Maybe something is wrong with the drive
> or the cable.
I suspect the cable for USB-C.

The USB-C cable:
$ lsusb -tv
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=uas, 480M
         ID 0bc2:2321 Seagate RSS LLC Expansion Portable

This is with it connected with a USB3-A cable:
$ lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
     |__ Port 2: Dev 2, If 0, Class=Mass Storage, Driver=uas, 5000M
         ID 0bc2:2321 Seagate RSS LLC Expansion Portable

A newer drive in the USB-C port:
$ lsusb -tv
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=uas, 480M
         ID 0bc2:ab5a Seagate RSS LLC
> Another possibility is for the hardware database entry for product 0x0003
> to be changed simply to "Linux Foundation USB-3 root hub", so that it
> doesn't specify 3.0, 3.1, or 3.2.
>
I like that idea.
