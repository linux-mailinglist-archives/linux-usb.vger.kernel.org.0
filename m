Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E04BA17D487
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2020 16:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCHPy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Mar 2020 11:54:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42683 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726270AbgCHPy4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Mar 2020 11:54:56 -0400
Received: (qmail 31319 invoked by uid 500); 8 Mar 2020 11:54:55 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Mar 2020 11:54:55 -0400
Date:   Sun, 8 Mar 2020 11:54:55 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: dvdrw USB3 drive seen as USB2
In-Reply-To: <5d16425c-a054-779e-cc3d-efad46ee07f0@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2003081143200.30710-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 7 Mar 2020, James wrote:

> https://github.com/aircrack-ng/rtl8812au/blob/v5.6.4.2/README.md
> > USB Mode Switch
> >
> > 0: doesn't switch, 1: switch from usb2.0 to usb 3.0 2: switch from 
> > usb3.0 to usb 2.0
> >
> > $ rmmod 88XXau
> > $ modprobe 88XXau rtw_switch_usb_mode:int (0: no switch 1: switch from 
> > usb2 to usb3 2: switch from usb3 to usb2)

Have you tried using this driver?  Does it work?

Maybe you can convince the authors of this 88XXau driver to merge it 
with the rtl88x2bu driver already in the standard kernel.  That's what 
was managing your Realtek adapter in your earlier email.

Alan Stern


