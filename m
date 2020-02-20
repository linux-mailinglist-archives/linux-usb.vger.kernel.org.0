Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21A15165B78
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 11:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgBTK1t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 05:27:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:46154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbgBTK1t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Feb 2020 05:27:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 6A212AD39;
        Thu, 20 Feb 2020 10:27:47 +0000 (UTC)
Message-ID: <1582194461.6843.9.camel@suse.com>
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
From:   Oliver Neukum <oneukum@suse.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 20 Feb 2020 11:27:41 +0100
In-Reply-To: <24141.6739.313167.448875@beetle.laas.fr>
References: <24140.5498.228141.264272@beetle.laas.fr>
         <1582106185.9787.9.camel@suse.com>
         <24141.6739.313167.448875@beetle.laas.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 19.02.2020, 12:21 +0100 schrieb Anthony Mallet:
> On Wednesday 19 Feb 2020, at 10:56, Oliver Neukum wrote:
> > thank you for the detailed report about an unusual bug. Could you
> > test the attached patch?
> 
> I did not actually run it yet, but at first sight it seems that it will
> mishandle the ASYNC_CLOSING_WAIT_NONE case.

You are right.

> Yes, no problem. Thank you.
> I hope my patches follow the required format, I'm not sure about all
> the details.

The patches themselves look good. Please follow
Documentation/SubmittingPatches

	Regards
		Oliver

PS: my mailer seems to suffer a malfunction with HTML.
Sorry for the erstwhiole empty post
