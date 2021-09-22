Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9559141483E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 13:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbhIVL41 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 07:56:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:54894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235802AbhIVL41 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Sep 2021 07:56:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F35B60F41;
        Wed, 22 Sep 2021 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632311697;
        bh=3Mxh0P6aCvQsrpS3PUJ0pcOYGUgRN1D2KuHRTIarZug=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=gHNobTSh2yTz77T6Gd6ZiwWI++vU2PwXrfK9RGg19E4lj0CAmvDHBHrKmWiXkaPRu
         tRIzrpPUPuyym0HEGAm0vvKef2kr0Aw/ozlIYbd0O9tKtDL2Auc2pJCvcmQ7hQKmTl
         AtuLXBpd37bt37reSw9FfqY9eW6mq2ADvW+gYSY//yDXfhoI3R0ogGT33YA/cvC2g3
         zvbXAueDSiXbCXVXQgk0cIBjz5YhTGGqc4E18MQdMI9DUqbtW0qfZ5jpgSbjJ0xocP
         rCNcQVl99TUabIvvlb4mAiidqw8eyktC9tivJk+CrlRmzmdzSPnlQD2h2nCq5lJvs/
         LzGoisfYKDYRg==
References: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
 <7c3386d2f2b315fa6e248fc664efefb9a2de35e9.1632307026.git.shubhrajyoti.datta@xilinx.com>
User-agent: mu4e 1.6.6; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com,
        git@xilinx.com
Subject: Re: [PATCH v3 2/2] usb: gadget: udc-xilinx: Add clock support
Date:   Wed, 22 Sep 2021 14:54:34 +0300
In-reply-to: <7c3386d2f2b315fa6e248fc664efefb9a2de35e9.1632307026.git.shubhrajyoti.datta@xilinx.com>
Message-ID: <87k0j8rfjn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> writes:

> Currently the driver depends on the  bootloader to enable the clocks.
> Add support for clocking. The patch enables the clock at  probe and
> disables them at remove.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
