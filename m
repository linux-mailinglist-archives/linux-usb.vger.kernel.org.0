Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAE4165828
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 08:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgBTHGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 02:06:46 -0500
Received: from mail-ed1-f47.google.com ([209.85.208.47]:40820 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgBTHGq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 02:06:46 -0500
Received: by mail-ed1-f47.google.com with SMTP id p3so32448660edx.7
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 23:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=QsZ2JYt37Z8iPsydjCFOBx3tPn53tACIMn75yL5vbfc=;
        b=aGq2qXYX71FRCCR1VDxVIyaPbk9YHyXXD7hID8myPCj1XHMpdcmuFPCs7G9ttaIqwu
         DfiVbB3Vt5/G8uDiaqZa1rV+mPZHKkwiJspasqlVc2QylC39Kl3aAO5OD7Vtshri1Z8D
         bttnilkw7gtDH6euOxNFMfn7GiC9RUFhPiEgt9oGwCrxstOoJFvId/zFkBbhNH0bTyzq
         LkqaR0zGKuMNPYK/wGALQfxa5n0lPqyDHiv4xl1x7lNRE6TkZ/cr7KCoBE7GWYENB66Q
         sTA9/vf4AunujuMLfKpLfcPxebiwUhM6Ve2DiK4TxYDqMicGtU5G/bGU+0bECVxNmcaW
         uMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QsZ2JYt37Z8iPsydjCFOBx3tPn53tACIMn75yL5vbfc=;
        b=S9/+ENh4krKNw25iDTP7CruJdgIEI0ki2ZOgQny9wvZ0TLOJlmB67XOHbMhIVfvgb8
         WwXeIx/MDqntjBMSLQP2UDWTjnMuvzWK9/ody+Z8jMXkdufMFBFyQh+8LiO5iVx0dvFf
         EN5UEpKfSiv3/XbMxXLahBoOWULMDOs3aQd5dM1PxaKDZ7sKIaPu3HbzTy95Ljomrhn3
         EItodrbIut6Nxn1K/K5oxbLtPkinrg4HeZQutx3cTuhW9n9/7/ndUl5lhwF1Wdd0WTMw
         6bLKUXkyGghSaYrMtc6IUL1OII1Re+wgOQVzHzrqSZxwHMlygF7dNorpuMRgcFCzzjxs
         QICQ==
X-Gm-Message-State: APjAAAVjZVk0Dm0pxy6Pexe7XCE+kjdXp7bUfER/UlYM/A3mHws/EL8T
        wd3BTYmoYapyoheaYHiBAXl7hm+u/encPXOGVDcH9m6E
X-Google-Smtp-Source: APXvYqzu6k38aV0xNbSlceJlYn70v5bo7U07DnZjyPRlOcibKgNFop/strPsqSlF4za+s7AXlu94Nl/PnJFqcaPmP1A=
X-Received: by 2002:aa7:d9c2:: with SMTP id v2mr26557116eds.88.1582182404702;
 Wed, 19 Feb 2020 23:06:44 -0800 (PST)
MIME-Version: 1.0
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Thu, 20 Feb 2020 08:06:34 +0100
Message-ID: <CAAfyv36n=--KiHmdyS7hOGzF8fVtq8y=uZx0cxARgp7fUta4ng@mail.gmail.com>
Subject: functionfs gadget with multiple endpoints
To:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm playing with functionfs and use configfs + functionfs + ffs-test
from kernel to test connection between my device and host. ffs-test
example provide 1 configuration with 1 interface and with 2 bulk
endpoints.

I'm writing application which will write/read data to usb device but
can be accessed from other multiple application. I'm planning to write
kind of gatekeeper which will serialize data to endpoint and notify
reader about received data.

I was thinking about other possibility to extend gadget to provide
more endpoints (like 2). I was able to extend ffs-test and also I can
send/receive data (using libusb) over original endpoints but not over
new created one (I've run 2 instances of same application which
basically create transfers for 2 different endpoints) but when running
second application I got this error:

libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16
libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16

I'm not USB expert but multiple endpoint should be possible (maybe I
need to put them to other interface?-> tried that also but got same
error as above with errno=2). Thanks for any pointers and advice.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
