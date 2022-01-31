Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FE34A4A38
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 16:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377144AbiAaPPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 10:15:53 -0500
Received: from netrider.rowland.org ([192.131.102.5]:58969 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1344395AbiAaPPe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 10:15:34 -0500
Received: (qmail 273915 invoked by uid 1000); 31 Jan 2022 10:15:31 -0500
Date:   Mon, 31 Jan 2022 10:15:31 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: what could cause a cmd cmplt err -2
Message-ID: <Yff9E6iURoMhWOJz@rowland.harvard.edu>
References: <b83861ab-fd5e-3021-70d1-3647f7b8eeb0@lockie.ca>
 <YfdErJ/SyFB2I5UA@rowland.harvard.edu>
 <18b2040c-dea0-e7c4-fd10-c29701d55b91@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18b2040c-dea0-e7c4-fd10-c29701d55b91@lockie.ca>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 30, 2022 at 09:18:40PM -0500, James wrote:
> 
> 
> On 2022-01-30 21:08, Alan Stern wrote:
> > On Sun, Jan 30, 2022 at 01:55:35PM -0500, James wrote:
> > 
> > It's not easy to tell why the command timed out.  Maybe the drive
> > encountered a problem and therefore wasn't able to execute the command.
> > Or maybe it did execute the command but the response message going back
> > to the computer got lost.
> Can I increase the timeout?

I believe you can change the timeout value by writing to 
/sys/block/sda/queue/io_timeout (note: the value in that file is in 
milliseconds).

> The error is always exactly the same.
> Could there be a bad sector on the drive?

Certainly.

Alan Stern
