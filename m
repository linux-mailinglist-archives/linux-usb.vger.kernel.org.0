Return-Path: <linux-usb+bounces-5228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03102831BAF
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F93BB233A2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BC1646;
	Thu, 18 Jan 2024 14:45:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C01819
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705589153; cv=none; b=nnD4XAlXjinc/7ZMBojdmnptk7ga+i/ygX6giQvyMkXumdrmO74wJUfXQ+pxISCsZp6Fcy9zNzTp4HHgF618g8oaxSkwNm4+msdlXxGJtl2T1scuDHKcy0nZDJMsFbnf68OOPAS/P58FTui9ygMPVvvAsxBYK1A0knC02sDfM6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705589153; c=relaxed/simple;
	bh=M/xwViw91W//vrczNJrcdB8aIjZE62iFE9A6Ma3HLX0=;
	h=Received:Received:From:To:Cc:Subject:References:Date:In-Reply-To:
	 Message-ID:User-Agent:MIME-Version:Content-Type:X-GND-Sasl; b=SK/fmRaLTbddESqXn6gKrqoYKN9wiepWLEnM0NSp8WaEg4HqD7AhKNtD5PTvcQZxDs1pDKMrDRvVlvkjMYM8ABSvs+C0druIMHq4mblul1BrhgTPRpUkuf+sYHrzKhF8fu4YXD8p3CTegbxAPQXkUhY4N/IBOAkb/e12RHslisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06C5CC0005;
	Thu, 18 Jan 2024 14:45:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1rQTeH-00GpGv-10;
	Thu, 18 Jan 2024 15:45:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,  Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v2] usb: gadget: f_fs: expose ready state in configfs
References: <20240118125137.3996800-1-peter@korsgaard.com>
	<2024011800-eatable-subdivide-18ac@gregkh>
Date: Thu, 18 Jan 2024 15:45:41 +0100
In-Reply-To: <2024011800-eatable-subdivide-18ac@gregkh> (Greg Kroah-Hartman's
	message of "Thu, 18 Jan 2024 15:18:16 +0100")
Message-ID: <87h6jaitt6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Greg" == Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

 > On Thu, Jan 18, 2024 at 01:51:37PM +0100, Peter Korsgaard wrote:
 >> When a USB gadget is configured through configfs with 1 or more f_fs
 >> functions, then the logic setting up the gadget configuration has to wait
 >> until the user space code (typically separate applications) responsible for
 >> those functions have written their descriptors before the gadget can be
 >> activated.
 >> 
 >> The f_fs instance already knows if this has been done, so expose it through
 >> a "ready" attribute in configfs for easier synchronization.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> Changes since v1:
 >> - Add documentation snippet as requested by Greg.
 >> 
 >> Documentation/usb/gadget-testing.rst |  8 ++++++++

 > Shouldn't this be documented in Documentation/ABI/ instead?

Ahh, we have documentation in too many places. I'll add it to
Documentation/ABI/testing/configfs-gadget-ffs as well and send a v3.

Thanks.

-- 
Bye, Peter Korsgaard

