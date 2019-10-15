Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8D3D83CA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 00:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732792AbfJOWfZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 18:35:25 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.2]:34686 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729970AbfJOWfZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 18:35:25 -0400
Received: from [46.226.52.103] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.eu-west-1.aws.symcld.net id E1/9D-09746-8A946AD5; Tue, 15 Oct 2019 22:35:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleJIrShJLcpLzFFi42JR+vb8ke4Kz2W
  xBudeS1osWtbK7MDo8XmTXABjFGtmXlJ+RQJrxtpVm1kL5nJVHP2V2MC4k6OLkYtDSGAqo8Sl
  7kesIA6LwERWiZ+XF4M5EgLLWSU697QzQTibmCR+TlnDCOE0MUpMu7GauYuRE8hJkzg1bQYLX
  KKxdQEbSEJIQEXiXM8VNogtC5kknp29ApbgFXCVWHxqNguILSygLrFpeTuYzSagJbF4agM7iC
  0iICtx+MpvoA0cQFepShzc6w8SZhbQlGjd/husRBSoZNruPhaIkYISJ2c+YYGokZdo3job6jh
  ZiQMnvzNB2JISB1fcYIGwbSQu7brJOoFRdBaSsbOQjJqFZNQCRuZVjBZJRZnpGSW5iZk5uoYG
  BrqGhka6hpamQNpAL7FKN1EvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwelIKDuftYOw+8
  lrvEKMkB5OSKK/Pk6WxQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR417otixUSLEpNT61Iy8wBRj
  JMWoKDR0mE94kHUJq3uCAxtzgzHSJ1ilFRSpw3FCQhAJLIKM2Da4Mlj0uMslLCvIwMDAxCPAW
  pRbmZJajyrxjFORiVhHkjQabwZOaVwE1/BbSYCWhxoP5ikMUliQgpqQYmxu3NlqkiUUf18oXd
  arNnLC/i3KzQVv7w6bJFn5aYxghXTEg3XlY86bJYFkuC35Mjs1zSlFSmXBAIM7U9m2QhEaf6k
  1XihMCGm5zLhL8/emyif2+ltHDw1ro5t6M+Xdn5eMKtA/Xcj1v2qO/9Yp4Uz7T3Yss6zq6cPC
  ld/nlpM8q8n/ofK5N+n3/ti+8TbqZftjosmzoWsHOdmLCnP1jd4NsapdW/DtXY6akcqStYcdk
  8Sn3TzAlRS7+beGRfMNHSOWtncdlHRGipyfvDstu+yPx9mDfvRjiHUfLXzpmGzMb7tfk8Z6xf
  sC7nVBeroeQK0+8HlSfWvvjSb8Lbs1/S2o/XIUXdda6HybqjDHuUWIozEg21mIuKEwEmpcKqm
  QMAAA==
X-Env-Sender: marc.fauvain@bbva.com
X-Msg-Ref: server-11.tower-267.messagelabs.com!1571178919!54333!1
X-Originating-IP: [34.246.231.226]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13811 invoked from network); 15 Oct 2019 22:35:20 -0000
Received: from p11c.mail.dlp.protect.symantec.com (HELO mail.ds.dlp.protect.symantec.com) (34.246.231.226)
  by server-11.tower-267.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 15 Oct 2019 22:35:20 -0000
Received: by mail-oi1-f200.google.com with SMTP id r67so12492847oif.18
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bbva.com; s=google-bbva-com;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=O/Q5deHZzijWftfxiqHiZSk4ZfOb5cNx4ZUXQc3ZIRI=;
        b=ZPOVxUGk4uBskFYpzoZnMvi6rOvzaZnaOMYXa4wGy9DvOTaYwXtxO01JJ2Wn104KoB
         mBY9pbtu+lQdKq/kmsvici43qQFrxZpNmMFmkkehA1ZsqdcAr/+IZc/Ia1OhLaFEMHfZ
         KU6zUKVxBRjDVQIRQNYkS7aSHuBQ06fp7Ty+fCPqPOpuI+Gn32mbwAiMhDVVwsZX4yWx
         fWl1YHIZ4W2lLrVPtv1UHmM+cvLHcQ+qD0Bzmg3ny6SAJ1c1Hetbmp4gMVoUOiDogNq5
         utg/MWll78+m4/5JaXiRM2J2V9lyONpzstNPbJbagta+tMCHPDpeBuQH53ldLXGN06Ei
         sS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=O/Q5deHZzijWftfxiqHiZSk4ZfOb5cNx4ZUXQc3ZIRI=;
        b=hcDDMtBOs1i6dwqYIO1lRuKdRV6B2EvtVTMOqCDu0uMi+qyh82E5w/dzehaEaMrDpc
         mFwQMtdHjEZZ9XhJPYjemmc1wOBMD8NeG2XebmbLq9DDdXNyoOYtY5zDr1qFi+usaZ4I
         NhMz2hGXWeW/1G50A7pxbtXsiCPZFh5N54T4ccAit+1Y4/K5ylia2NOcJgP9LpJ9e4ib
         v4i00IuKgIYcJmM3VDQ+kUA+4VGCXvlV5roZTCWlNi86vWuzTl6jJA109Gp2Ez6y0jhc
         mTNLc26bJDSUkj73vHm/1kbIS7GpI7+4kZ1O6aAjbbYKihUNTTBRRlihQv5J5aGzfIcz
         UR2w==
X-Gm-Message-State: APjAAAVPtDYcY5diwrg8SlHTS5XDRzETj11HFFUlrlRTiDOMmfuFIBy+
        h4U3DyomU4bvqFAbTEIXkksYpsFFk9Aeg1sS8bdNBarrU5/NgdLQNBUaj0Phn+2GnmHvCne7b2G
        wvJ810fmAroH4v0A1uGHCgyesbjZ0q7JBWjtgdjOAz1JlyZGfeLsORQMcnDzyFhJXO9/MKKzzeC
        ho1x9Y4tCX2dR8lpuZaiJ17ZSEmvQCfu8b0IwlGLf0rnI1db6Ej1y4/BUt0xIIJYsiW2by/g==
X-Received: by 2002:a05:6830:1154:: with SMTP id x20mr29244837otq.219.1571178917915;
        Tue, 15 Oct 2019 15:35:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjiZDIz5ddlNtQ2rEFWI65z2Sfm+dNVgGX7XLRtJVlRsJ2KjL/FzvROUYN8d+1Olvb++Xmqw==
X-Received: by 2002:a05:6830:1154:: with SMTP id x20mr29244800otq.219.1571178916835;
        Tue, 15 Oct 2019 15:35:16 -0700 (PDT)
Received: from LightBook.localdomain ([189.236.36.180])
        by smtp.gmail.com with ESMTPSA id a9sm6711912oie.7.2019.10.15.15.35.15
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:35:16 -0700 (PDT)
Message-ID: <4de35a5de7906cfa54de6eb4c5236daa05e6fdf3.camel@bbva.com>
Subject: USB-C dock ethernet port issue
From:   Marc Fauvain <marc.fauvain@bbva.com>
To:     linux-usb@vger.kernel.org
Date:   Tue, 15 Oct 2019 17:35:14 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-dl-symantec-google: from-mx
X-CFilter-Loop: Reflected
X-DetectorID-Processed: 626c2525-8c57-41e8-9537-107a9b50c1ee
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Not specific to a kernel version as I've been seeing the bug since
kernel 4.8. When connecting a macbookpro 14,1 to a USB dock (from
Pluggable) with Ethernet, USB and Audio via provided (Pluggable) USB-C
cable, Ethernet port is not always recognized with provided dmesg.

Strange because when connecting to the dock with an Apple USB-C cable,
ethernet port is always recognized, however with a different  name
`enp0s20f0u8u3`. With Pluggable USB-C cable I tried to power cycle the
dock and `sudo lsusb -c` to no avail. Ethernet port was not recognized
anymore.
I recently upgraded to kernel 5.2.14, turned off/on the dock, and ran
`sudo lsusb -v`, Ethernet port magically appeared (with Pluggable USB-C 
cable) however with `enp0s20f0u8u3` name and not `enp7s0u2u3` as
before. There seem to have some instability when setting USB connection
at some point.

Back after a few weeks, just after power failure, ethernet port is not
recognized anymore. running kernel 5.3.5 now. sudo lsusb -v now does
not do any magic. ethernet port stay unrecognized and dmesg shows 'usb
4-2-port3: Cannot enable. Maybe the USB cable is bad?'..

Regards

-- 
BBVA

Marc Fauvain

Head of Equity Trading Americas - Managing Director

Tel. +52 55 5621 9831  Cel. +52 1 55 3755 0028

Corporate & Investment Banking - México D.F.



