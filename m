Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E3E726365
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 16:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240702AbjFGOyi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 10:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240678AbjFGOyh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 10:54:37 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B180619BB
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 07:54:35 -0700 (PDT)
Received: (qmail 228244 invoked by uid 1000); 7 Jun 2023 10:54:34 -0400
Date:   Wed, 7 Jun 2023 10:54:34 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Colin Williams <colin.williams.seattle@gmail.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>
Subject: Re: Cannot access device / WD Portable Game Drive 5.0 TB USB Inbox
Message-ID: <14dba6aa-91f6-46c3-834f-be5d35e616e3@rowland.harvard.edu>
References: <CAPXXXSCjjJ5=+zigZyfX65uNOQYYJun1pQspq4jgJpC+TFJRPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPXXXSCjjJ5=+zigZyfX65uNOQYYJun1pQspq4jgJpC+TFJRPg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 01, 2023 at 04:00:56PM -0700, Colin Williams wrote:
> I've tried two cables and using two different computers to access my
> WD Portable 5.0 TB portable game drive that has a USB interface. Dmesg
> seems ok with line
> 
> `[ 4586.948425] sd 6:0:0:0: [sdb] Assuming drive cache: write through`
> 
> However when I try to access the device via smartctl / cfdisk / etc to
> get more information, I get something like no such device and then
> dmesg is populated with errors.

What if you don't try to use smartctl or cfdisk?  What happens if you 
just try to mount the disk normally?

> Does anyone have experience with these scenarios?
> 
> Are there any suggestions to recover my data or does it appear the
> device has given up the ghost?

If you want to get more information about what's going on, you should 
collect a usbmon or Wireshark trace showing what happens when the drive 
is plugged in and accessed.

Alan Stern
