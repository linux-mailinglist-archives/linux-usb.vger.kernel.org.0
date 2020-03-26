Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC531941F0
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 15:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgCZOtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 10:49:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57783 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726267AbgCZOtl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 10:49:41 -0400
Received: (qmail 9798 invoked by uid 500); 26 Mar 2020 10:49:40 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Mar 2020 10:49:40 -0400
Date:   Thu, 26 Mar 2020 10:49:40 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Kyungtae Kim <kt0755@gmail.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
 drivers/usb/core/hcd.c
In-Reply-To: <CAEAjamtTnn+BZAshQ7=DQ7QdRHO83AbHeZP3xY1CpSzmbaHPDQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2003261048010.5714-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 24 Mar 2020, Kyungtae Kim wrote:

> Thanks for the patch. Unfortunately, we don't have a repro program to
> test right now.

Okay.  Can you at least try running your tests with the patch installed 
to check that the patch doesn't actually break anything?

Alan Stern

