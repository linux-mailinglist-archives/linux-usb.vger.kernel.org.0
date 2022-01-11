Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D170F48A5DA
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 03:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbiAKCs6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 21:48:58 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:60575 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234043AbiAKCs6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 21:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:Subject:To:From:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cXMuw/cvYVeVorxh7nQpNk+KoDKjUdQQxSuSfPyK0gQ=; b=CXCVubbvYK5FTaqHrqFtwn3yYy
        P55YberZxtiK6qMS8PRtqJFL6IVlyOII3Dc3iuIWxmotfpyydOSLxj4PbvKYnHROIZdNjPA4EUGNz
        ZgDp7eDY1GhrQbcrjWyg+GxCuxDCSzuKMe/CbJv/iAyPBDKrAcUeuHJE8GIUNh7NCSWg8Ihc69XcT
        nObbikGGt+q41GWNZcYJGZHCpp4RLBJuFIpRWhbRdmL/XTzVQdrjjX4HW+7sNuUoWDpdjF3TAF/KG
        YLXJIna4CU9O5/QXThOCNYFO6jgT3WwHB4wQVs+U+M1Zf/VowxdfRQVYA4VKm4B89fFxZPKG4jBXC
        dHmae/6Q==;
Received: from [66.79.250.116] (port=41736 helo=[192.168.68.65])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1n77DV-0000qV-GD
        for linux-usb@vger.kernel.org; Tue, 11 Jan 2022 13:48:57 +1100
Message-ID: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
Date:   Mon, 10 Jan 2022 21:48:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
From:   James <bjlockie@lockie.ca>
To:     linux-usb <linux-usb@vger.kernel.org>
Subject: no name mouse?
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
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

$ lsusb -tv
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
     |__ Port 3: Dev 4, If 0, Class=Mass Storage, Driver=uas, 5000M
         ID 0bc2:ab5a Seagate RSS LLC
     |__ Port 4: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
         ID 0bc2:2321 Seagate RSS LLC Expansion Portable
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 5: Dev 4, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
     |__ Port 5: Dev 4, If 1, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 30fa:0400

Port 6 Dev 3 is the mouse I bought from Amazon.
Why doesn't have a name beside it?

