Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBFDF158180
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 18:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgBJRgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 12:36:35 -0500
Received: from mon1.sibername.com ([162.144.64.251]:56967 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBJRgf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 12:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
        Message-ID:Date:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=3e7vJxdN2t8dYOxSqIlx+iZ2udkKDfwvEEGFi2ZP9fc=; b=QPNuCzEu5/so4Yhsi7Kh4phCw3
        uYIlA4tBeuADpX9k9z0KVb0QXuU2ReChv/F+INljSkQoxHqEX93pN5Jj4ZPvgiPavxe/TvVzDTPCx
        fpkALWKEKiltwHoQi2sQu8azSvoZ8mpTW6ot09EOdUG+lKPQXcpic7dVImF8dIKrXJHISbLmBFvbV
        tCwZWuBwjSma5Dpbyq8Firy2Xivhv+iN9urbCIx9u8Wf5YlGWIYfJecyNgsF3wBx4jxh1DSPs5vq0
        DNkLt35EnJ07eiRTDNurwotdFQJcWJCHBhaViKecMwx1hZ6TJH//Gujlyta7VJKGqmZuIuG2pwjzH
        aBudiK0Q==;
Received: from 216-58-18-206.cpe.distributel.net ([216.58.18.206]:46481 helo=[192.168.1.45])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j1Cz2-00DMt9-L6
        for linux-usb@vger.kernel.org; Mon, 10 Feb 2020 12:36:33 -0500
From:   James Lockie <bjlockie@lockie.ca>
To:     <linux-usb@vger.kernel.org>
Date:   Mon, 10 Feb 2020 12:36:30 -0500
Message-ID: <170302c8930.279c.665a3322dda79c663fe860d9fff7dd5d@lockie.ca>
User-Agent: AquaMail/1.23.0-1554 (build: 102300001)
Subject: dmesg -> lsusb -t
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
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


$ sudo lsusb -t
/: Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
    |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
/: Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 480M
    |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbfs, 1.5M
/: Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
    |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M

$ dmesg
[42540.188430] usb 2-2: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd

How is 'usb 2-2' mapped to lsusb?
I'm guessing it is the last entry from lsusb?

If it was a Gen 2 USB device it could run at 10000M?

Why is the first line of lsusb only 5000M?


