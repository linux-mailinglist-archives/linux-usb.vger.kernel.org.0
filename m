Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DC334B447
	for <lists+linux-usb@lfdr.de>; Sat, 27 Mar 2021 05:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhC0Eu7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 00:50:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhC0EuZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Mar 2021 00:50:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46B92619E4;
        Sat, 27 Mar 2021 04:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616820624;
        bh=Z0tIGB2gR7iDVQpCU37gBJN0QgIrfaYJ/ZrhmVD8cig=;
        h=Date:From:To:Cc:Subject:From;
        b=OQGqM6eYLmHBEaCcvytWwaDcihGCee1Wo6z02LCGf7PKstKQub4Rez35nfO8VW7i3
         vUC9ad5U3fVy0GYvHZq/JkAA+EWdPDoGgr0nPltgIxP25Udq/jUUPObmMBglJYiL6t
         1BYbvo9gtlvEFrz75cWhIb3sHW1T0ERAROUsybiu4bx35CQY4C5a6mEnOyWZRO3kMv
         p6KiE/jrwhbkt8opD2a9thhhWh4myXcsrgmzhC5CzD/plfV4vveDkJzhRYYtWYodoB
         U+8IQusBNWpWHukylyN/U6oUvgb4y2d5e6dn6W+PRXqI7YRB+ChQOv3Yd9yDPDLD05
         Vu8ZduwfKJRlg==
Date:   Sat, 27 Mar 2021 12:50:16 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     linux-usb@vger.kernel.org
Subject: About use case of cdns3-pci-wrap.c
Message-ID: <20210327045016.GD28870@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pawel,

From the code of this file, it seems the controller driver is running at
PC side, but the hardware controller is at verification board, the two sides
are connected by PCIe. Am I right?

If I am right, the memory (eg, the TRB ring address and data buffer) the hardware
try to visit is at PC side, but how controller visits PC memory since the TRB ring
address is allocated dynamically by controller device driver running at
PC? How the local bus arbiter knows it is PCIe address at verification board?
Besides, could the upstream code run this IP verification solution through PCIe
without changing any code?

Thanks.

-- 

Thanks,
Peter Chen

