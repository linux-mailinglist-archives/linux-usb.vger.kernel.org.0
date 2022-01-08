Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD164488383
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jan 2022 13:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbiAHMAJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jan 2022 07:00:09 -0500
Received: from mail.he1.boomer41.net ([178.63.148.114]:56732 "EHLO
        mail.he1.boomer41.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiAHMAI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jan 2022 07:00:08 -0500
X-Greylist: delayed 48581 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 Jan 2022 07:00:08 EST
Message-ID: <2d3b287e-eae0-d0bb-12e7-c0e3cb5b1391@stephan-brunner.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stephan-brunner.net;
        s=mail; t=1641643204;
        bh=cpmJN4IHZvQUOQbQJkBB0R0iWgLBph7iSy9SfKH/+jo=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To;
        b=cnwuTNthYAgQJzTupqjnuGwfOyDdVMmJOgRs2rqfcOp0Cfz9IF5nHOHfDAXorG/L0
         YmVPKdGIvHQrj4cTBj4dj916dBD4gf8a3hUXaZjXSsIPk+zY985+tToUvkGZjYopIe
         K26ch7uSgESnqUkwloy08ErtvMAAX6J1YgWRz69mlBTYVaOobaCVljemlTa5NWWBqM
         jV5Iyj4oOY8+MvrHp3ZV+FTe6PNkbe4LEVeIyrLO6b6djsgOnFLD7YO6a6KDzO7qTq
         zBdd3Kh17qAiu28lTWEu5dEHIXIZMw1Gan/2IXDfVbNP0J637BvwmGc6XUDz0DlgjO
         Qb/7FsdXrqKlY5qWEpF74kqAJVezlF351dO0FyTLakdkUBTjkcoO2+0Voc0dIjJda5
         W2GIzIIHLeDLRS/9V+l0bQdFr7E5VjOHkLLPFNHz5KuFylSW6lTOlU6cATdF4jN54P
         rbAXI1j182abNtKs1sGqH+GM1EPCsEwpa1PkhpKdyZmNXLps87066pBMxKQi0nJzPi
         fXvN/mfvhxibnium0XyngqnhuJK9FCFMtfr7Fl3QbOp4FPPwQ8wV2Ns3RManq0sW+b
         scTdDmoCBTAmObKu1YOMO53fBsLfmvoS5ETehiOGHjsk9o0iQcinHCP0iYG/1m7tO/
         taAhR1AMaFeXJv55iJAvwJo0=
Date:   Sat, 8 Jan 2022 13:00:06 +0100
MIME-Version: 1.0
From:   Stephan Brunner <s.brunner@stephan-brunner.net>
Subject: [PATCH v2 0/1] USB: serial: ch341: Add support for GW Instek
 USB2.0-Serial devices
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org, s.brunner@stephan-brunner.net
References: <1e424713710d318a76b00d9ff40f4005204dd60b.camel@stephan-brunner.net>
Content-Language: de-DE
In-Reply-To: <1e424713710d318a76b00d9ff40f4005204dd60b.camel@stephan-brunner.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch resent as v2 because my MUA didn't like the tabs in the patches
making them unusable.


Stephan Brunner (1):
  USB: serial: ch341: Add support for GW Instek USB2.0-Serial devices

 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1

