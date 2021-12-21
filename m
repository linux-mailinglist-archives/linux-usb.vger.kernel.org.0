Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32BB47C17F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 15:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237612AbhLUOaD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 09:30:03 -0500
Received: from netrider.rowland.org ([192.131.102.5]:39691 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229583AbhLUOaD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 09:30:03 -0500
Received: (qmail 936494 invoked by uid 1000); 21 Dec 2021 09:30:02 -0500
Date:   Tue, 21 Dec 2021 09:30:02 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andrew Lunn <andrew@lunn.ch>, Rajat Jain <rajatja@google.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: Avoid doing warm reset on disconnect event
Message-ID: <YcHk6pam0plSFT3M@rowland.harvard.edu>
References: <20211126115652.1134230-1-kai.heng.feng@canonical.com>
 <YaD9oubkHPzHtSY4@rowland.harvard.edu>
 <CAAd53p6uXBa2zms1M0aqvRhVWq-kNtw2LvgE5ai94NWMDi5rYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p6uXBa2zms1M0aqvRhVWq-kNtw2LvgE5ai94NWMDi5rYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 21, 2021 at 11:35:25AM +0800, Kai-Heng Feng wrote:
> (
> 
> 
> On Fri, Nov 26, 2021 at 11:30 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > Why is it correct to skip doing a warm reset on a disconnected port here, but not
> > correct to skip doing a warm reset on a disconnected port in all the other places
> > where hub_port_warm_reset_required() gets called?
> 
> Can a disconnect event happens to other places other than port_event()?

A disconnect can happen at any time.  After all, users can unplug USB 
cables whenever they want.

Alan Stern
