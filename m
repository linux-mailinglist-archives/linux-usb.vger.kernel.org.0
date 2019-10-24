Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34CF8E2CC3
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 11:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbfJXJCE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 05:02:04 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:43474 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbfJXJCE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 05:02:04 -0400
Received: by mail-lj1-f176.google.com with SMTP id n14so24123038ljj.10
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=sA1E5AfB56QRzsAe6f0UUw9vruE6VfSgiGLjQ4iUUhk=;
        b=XscpeN5xwKeDT/qlkBa2GLc1Msjk2FSCHk1JG/sD4cfup8b12yKIMC1DM92DDXyAUw
         QKWJ376IU+f2+NsVinkM4SG1Avbo+sqi0CQSTCKxpuErY46fI0zcDqoL3nLwl85vynFA
         Brd9Nr2EsGguPRmHRz5Q8grhYjUBRJnzuTYrnGCdqJ2dc3ESYwclv/1tHWbxADR4FoM3
         jytdy3kFg7z5N2Ar+WYA8PWwoSewnZuPmcot97N8O0WjigyfBzeP6lAinY0rqAKrKJfx
         ME8u+q0T5u8y9ySz/t9yhzACOg+V1BfpeuDTbe38tDU9flwyjypM49lyQ3jvVPQorDwT
         9K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sA1E5AfB56QRzsAe6f0UUw9vruE6VfSgiGLjQ4iUUhk=;
        b=lxFN0WvVCauogTmJfXDPP9C0L8et/xrfTu+n+W2AUdT/KviLU1nr25KrxvacmAh+tm
         q64TR8dBD59aFDNK/n6n/D8RysxvfDbVLclcN0hd2jkVe/jRnrtPh1uMGj/Rlr6FjK+Q
         XxkByPHavoXuccvFWWxgIcQkhykz8K1elQa6HGAQ9bqXqchQNFCUYf7LM1bvzg5VP5yJ
         AtNznjHrnnnkt2Tj0pvU1KR7eaju4H4mN8doDiS1pAUFiTBFfcsS5QdWiCNNMHw1I+75
         PrhUpoLC+ju4gf7mQai/gNtB0mRHsllSiQlPrVhOSjnuInFBmLuKqzeR0rWKUC+MDdxb
         qLvg==
X-Gm-Message-State: APjAAAU08GzU6Gi+h6tgk/MdoPoiKxv3pWpBtU15n+h+HB4GZtFWRs5v
        FT1NNNVc+NHFx7V9k9kepl2jKB/XWoNQ43OfdYQm+RIfYbE=
X-Google-Smtp-Source: APXvYqw19oEPpXdgkQGjYwqMszcdeS5GVmoXvY2SxHur40XuOFPV22Ga5RWzkgctj/5wxPldXW2rKPlYHyxd7jz3adQ=
X-Received: by 2002:a2e:6c0e:: with SMTP id h14mr10072784ljc.92.1571907721618;
 Thu, 24 Oct 2019 02:02:01 -0700 (PDT)
MIME-Version: 1.0
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Thu, 24 Oct 2019 11:01:50 +0200
Message-ID: <CAOYdKdiYdnH246mZSRZ==dhjcM3Oah5vFP1Nh=m4SgyvJKNn2w@mail.gmail.com>
Subject: Programmatically switching a USB port from Host to Device mode (not OTG)
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks

I am using a GL.Inet AR750S (Slate) travel router, which is based on
the QCA9563 SoC.

I am trying to see if there is any way that I can get it to operate in
a USB Gadget mode.

According to twitter support
(https://twitter.com/GLiNetWiFi/status/1187190831746179073), the
router's external port is connected directly to USB1 on the SoC, and
the internal port is connected via a USB hub to USB2.

According to the datasheet which I found at
https://github.com/Deoptim/atheros/QCA9563_July_2014.pdf, USB1 should
be a Host-only port, while USB2 should be device-capable.
Unfortunately, the hub chip makes it impossible to test USB2.

So, my question is, is it possible to modify the device tree to
configure USB1 in gadget mode (even though according to the datasheet,
this is a reserved configuration) ?

Is it possible that a pure software configuration change may be
sufficient to change the role of the port, or would I need to remove
pull-up/down resistors as well to see if this could work?

Many thanks!

Rogan
