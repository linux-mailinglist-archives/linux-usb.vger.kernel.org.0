Return-Path: <linux-usb+bounces-1691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF97CB167
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C999281446
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 17:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B3831A9A;
	Mon, 16 Oct 2023 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC6930CED
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 17:34:01 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 81D8283
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 10:33:59 -0700 (PDT)
Received: (qmail 150486 invoked by uid 1000); 16 Oct 2023 13:33:57 -0400
Date: Mon, 16 Oct 2023 13:33:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, oneukum@suse.com
Subject: Re: [PATCH 0/7] usb-storage,uas: Support OPAL commands on USB
 attached devices.
Message-ID: <76575d36-15d3-491b-944e-71253907cfac@rowland.harvard.edu>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016072604.40179-1-gmazyland@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 09:25:57AM +0200, Milan Broz wrote:
> This patchset adds support for OPAL commands (self-encrypted drives)
> through USB-attached storage (usb-storage and UAS drivers).

This is version 2 of the proposed patch set, but you didn't include the 
version number in the email Subject: lines and you didn't include the 
summary of differences from v1 below the "---" lines of the various 
patches.

Patches 5, 6, and 7 look okay.  You can add my Reviewed-by: to each of 
them.

I've got some additional comments on patch 4 (in a separate email).

Alan Stern

