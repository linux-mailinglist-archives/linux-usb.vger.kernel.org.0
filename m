Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8E01AD181
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 22:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgDPUul (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 16:50:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgDPUul (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Apr 2020 16:50:41 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54999221F7;
        Thu, 16 Apr 2020 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587070241;
        bh=8pJkCj7VJiAh7Fv15BzmBG8woE/Stmsai3tvkbrbPqE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=n0UUlraLqLPjwYeqT/Ib4MzAhYTe3jERezX+JFSTgnmiiFuy1iRV9JufiLstTFI8H
         5ckfrA10BFFVj1UxLmtyVr0sPTHkM+RwAvR5h6q0kt7RRVULMAf2Sejz1b7U6I68dT
         dnrjquBKMape3ORtS5eDKMmqHRxAydReiX6vwno8=
Date:   Thu, 16 Apr 2020 22:50:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Fatal Goth <gothfatal@gmail.com>
cc:     linux-usb@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: Asus GA502DU usb-hid keyboard not supported (0b05:1866)
In-Reply-To: <CAPcc2qsLj7t5Ku2WVzaY7WfKqJTRLvU-1RN90PwLxnrEGednYA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2004162250010.19713@cbobk.fhfr.pm>
References: <CAPcc2qsLj7t5Ku2WVzaY7WfKqJTRLvU-1RN90PwLxnrEGednYA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 20 Mar 2020, Fatal Goth wrote:

> The majority of the function keys for this laptop are not operational, and
> neither is the keyboard backlight.
> 
> I've realized this is due to the hid-asus module not loading for this
> keyboard. However, when I add the device ID to hid-asus.c most of the
> function keys work, but some of the normal keyboard keys get incorrectly
> mapped as brightness controls, and the keyboard LED still will not
> initialize ("Asus failed to request functions: -75").
> 
> I'm having a go at trying to fix this up, though a helping hand would be
> awesome. Here's the patch I'd created to even get to that point:

The patch has been damaged by your mail client, and is missing 
Signed-off-by line.

Could you please fix that up and resubmit?

Thanks!

-- 
Jiri Kosina
SUSE Labs

