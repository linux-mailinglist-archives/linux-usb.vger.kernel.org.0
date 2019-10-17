Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2FEEDB9C2
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 00:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441676AbfJQWbt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 18:31:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51075 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732705AbfJQWbt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 18:31:49 -0400
Received: (qmail 4223 invoked by uid 500); 17 Oct 2019 18:31:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Oct 2019 18:31:48 -0400
Date:   Thu, 17 Oct 2019 18:31:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Benedikt Schemmer <ben@besd.de>
cc:     linux-usb@vger.kernel.org
Subject: Re: [USB EHCI DRIVER] [Regression] EHCI no longer working in 5.4
 series kernel
In-Reply-To: <36985a59-18fd-88c9-0f1e-0b356ba041e8@besd.de>
Message-ID: <Pine.LNX.4.44L0.1910171830550.4074-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 17 Oct 2019, Benedikt Schemmer wrote:

> Hi all,
> 
> I recently started compiling the 5.4. kernel starting with rc3 and noticed that both my keyboard and mouse aren't working
> when connected to the motherboards USB ports (they work fine when connected to an xhci extension card) and they work fine
> with the 5.3 series up to 5.3.6

Can you use git bisect to track the problem down to a particular commit?

Alan Stern

