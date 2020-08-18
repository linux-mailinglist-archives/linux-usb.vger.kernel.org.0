Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8193724821C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 11:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgHRJm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 05:42:26 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58539 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgHRJmZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 05:42:25 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B191824000C;
        Tue, 18 Aug 2020 09:42:23 +0000 (UTC)
Message-ID: <bd8e57a4c96df5c18a3019b9c20da45458db1ed4.camel@hadess.net>
Subject: Re: [PATCH v7 1/3] USB: Also check for ->match
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 18 Aug 2020 11:42:23 +0200
In-Reply-To: <20200818090037.GC28036@kroah.com>
References: <20200804113834.6409-1-hadess@hadess.net>
         <20200818090037.GC28036@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2020-08-18 at 11:00 +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 04, 2020 at 01:38:32PM +0200, Bastien Nocera wrote:
> > We only ever used the ID table matching before, but we should
> > probably
> > also support an open-coded match function.
> > 
> > Fixes: 88b7381a939de ("USB: Select better matching USB drivers when
> > available")
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> The subject line does not make sense, what is "also"?  Who is doing
> this?
> 
> Coming back to this after a week I have no idea what is going on, so
> that's a sign that it needs to be reworded :(

It's actually been 2 weeks. Were there any other changes you wanted
made in this patchset, or is that going to be it?

