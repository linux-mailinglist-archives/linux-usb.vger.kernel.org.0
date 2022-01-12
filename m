Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF3548BC13
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 01:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbiALA44 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 19:56:56 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:41203 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234143AbiALA44 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 19:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aAYdJb2RDzqLu4ltyyGojcxfdBZwEL3HLAzo1Q73Djg=; b=FQ1T7yMf6uJvqzDp7jdb5kjVtJ
        Cu6V9YjSLF3Sa3XPIV3SivbwmWKN9nITA8wga7aUpTaUaNJZpLDSSChBMzHjsQBUAr6q6ae4SmMBT
        MO7vP98NoSW6ZOX+U2JAxwhmBr6m/yNDHCpyn4sFRy4KveSeoBwJdIVIy3Ig5lv9Bu5+mCFXOvo8A
        +nCyax5lBFu+20qJOI7ujK0ERwRPg1ITycHm5bWtm1F/ucaTPiz4PgZika524d6Q24DO5QA4NiHky
        D5kR7h3txb8NacD77TOzeIbQkUMqBYQv37POl/OiVZW3VnuyilXLJn8MyC8rawu+ZdsvXQSdN4aRp
        ageaY9gA==;
Received: from [185.245.86.55] (port=42404 helo=[10.5.0.2])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1n7Rwe-0004mq-EY
        for linux-usb@vger.kernel.org; Wed, 12 Jan 2022 11:56:55 +1100
Message-ID: <830aa508-5c20-c7c9-5ba9-04bcf5ac7178@lockie.ca>
Date:   Tue, 11 Jan 2022 19:56:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To:     linux-usb <linux-usb@vger.kernel.org>
From:   James <bjlockie@lockie.ca>
Subject: problem with USB-C
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
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 30fa:0400

With my USB3 drive plugged in to the USB-C port which is supposed to be 
USB3.1.
https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp

$ lsusb -tv
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=uas, 480M
         ID 0bc2:2321 Seagate RSS LLC Expansion Portable
     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         ID 30fa:0400


Why are the hubs listed as Linux Foundation 3.0 root hubs and not 3.1 
root hubs?
