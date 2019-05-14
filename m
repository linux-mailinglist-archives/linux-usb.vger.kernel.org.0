Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D85C1C984
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 15:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfENNia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 09:38:30 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42026 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725854AbfENNi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 09:38:29 -0400
Received: (qmail 2188 invoked by uid 2102); 14 May 2019 09:38:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 May 2019 09:38:28 -0400
Date:   Tue, 14 May 2019 09:38:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Rick Mark <rickmark@dropbox.com>
cc:     linux-usb@vger.kernel.org,
        enterprise-infrasec-team <enterprise-infrasec-team@dropbox.com>,
        production-infrasec-team <production-infrasec-team@dropbox.com>
Subject: Re: Lack of length checking in USB configuration may allow buffer
 overflow
In-Reply-To: <CAEFJ+1OA+=SBRa_O3UupJT_KHm_XDw-4uJ9J3cRJQOW0T_c6aA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1905140935230.1483-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 13 May 2019, Rick Mark wrote:

> Hey All,
> 
> I was seeing a linux VM crash due to malformed USB configuration
> payloads being malformed.

Can you provide more information about this crash?  I would like to 
know exactly what errors are occurring.  As far as I can tell, the 
existing code already tests for all the things your patch adds.

>  I'm testing this patch now which should
> provide better security checking (but this is my first patch so be
> kind if I have things wrong.)

Have you read the loop in usb_parse_configuration() that starts at 
the comment:

	/* Go through the descriptors, checking their length and counting the
	 * number of altsettings for each interface */

(approximately line 585)?  This loop should carry out all the tests
that your patch is trying to duplicate.

Alan Stern

