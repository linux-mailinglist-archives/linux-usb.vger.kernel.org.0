Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECC322B248
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 17:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbgGWPQt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 11:16:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50545 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725808AbgGWPQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 11:16:48 -0400
Received: (qmail 1354420 invoked by uid 1000); 23 Jul 2020 11:16:47 -0400
Date:   Thu, 23 Jul 2020 11:16:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?iso-8859-1?Q?SZIGETV=C1RI_J=E1nos?= <jszigetvari@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: linux usb gadget - mass storage
Message-ID: <20200723151647.GB1352396@rowland.harvard.edu>
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
 <20200720162422.GG1228057@rowland.harvard.edu>
 <CAJK_Yh_ZAvuSBFdUitkPbzp_L69Fuew7cTKbeTH3X8aJdOJeqw@mail.gmail.com>
 <20200720172951.GI1228057@rowland.harvard.edu>
 <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
 <20200721150628.GC1272082@rowland.harvard.edu>
 <CAJK_Yh86DgD8wTKcCOtvKF9SxKuW61KfKq_rQied3VoK_N0Emg@mail.gmail.com>
 <CAJK_Yh9_Wr+HwEn2W5QK_KLX9NMyKyaOUO-QvCTcc7z8d17aBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJK_Yh9_Wr+HwEn2W5QK_KLX9NMyKyaOUO-QvCTcc7z8d17aBw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 23, 2020 at 04:12:44PM +0200, SZIGETVÁRI János wrote:
> Hi Alan,
> 
> I recompiled the latest kernel (5.4.51) for the Pi Zero, and now the
> patched g_multi module (or dwc2-hsotg for that matter) seems to load
> just fine, and I was also able to use a DVD iso image, and dd its
> whole content to /dev/null.
> Now that we could see that the patch actually works, what would it
> take for it to make it into the mainline kernel?

Well, first of all the patch has to be cleaned up -- unnecessary stuff 
and debugging lines removed, style matching the current driver, and so 
on.  Also, it should be integrated a little better: There already is a 
cdrom-emulation flag; maybe it should be changed to take on three 
possible values (disk drive, cdrom drive, or dvd-rom drive).

Mostly though, I have to be convinced that the patch implements the 
required functions well enough to be considered a valid dvd-rom device 
according to the appropriate spec.

Alan Stern

>  I have seen that
> multiple people have asked for this functionality in different forum
> threads in the past, and until now they were forced to resort to using
> homebrew patched kernels for it to work, or they had to give up on it
> if they weren't experienced enough to compile the patched kernel
> themselves.
