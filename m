Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B45C1B28D4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 15:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgDUN6p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 09:58:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39967 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728337AbgDUN6o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Apr 2020 09:58:44 -0400
Received: (qmail 21441 invoked by uid 500); 21 Apr 2020 09:58:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Apr 2020 09:58:43 -0400
Date:   Tue, 21 Apr 2020 09:58:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Cyril Roelandt <tipecaml@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>, <sellis@redhat.com>,
        <pachoramos@gmail.com>, <labbott@fedoraproject.org>,
        <gregkh@linuxfoundation.org>, <javhera@gmx.com>
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
In-Reply-To: <20200421030137.GA2492@Susan>
Message-ID: <Pine.LNX.4.44L0.2004210958070.20254-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 Apr 2020, Cyril Roelandt wrote:

> Hello,
> 
> On 2020-04-19 12:03, Alan Stern wrote:
> > [...]
> > 
> > Below is a patch which will tell the kernel that the JMS566's FUA 
> > support is broken.  Let me know whether it fixes the problem.
> > 
> 
> I applied your patch on top of v5.4 and was able to use the enclosure.
> 
> Thanks a lot for your help! I am glad I'll be able to keep using this
> enclosure instead of buying a new one.

Great!  I'll submit the patch for inclusion in the kernel.

Alan Stern

