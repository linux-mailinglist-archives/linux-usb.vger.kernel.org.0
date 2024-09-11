Return-Path: <linux-usb+bounces-14950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C083B97545C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 15:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69C461F2610E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 13:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709D819EEA1;
	Wed, 11 Sep 2024 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dvqjejD7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E3188A00
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062105; cv=none; b=GNXVdWDtJBdTX9utbw7ekZf29S7+ipikR1Q535dCtfdy6FFmpO2GdjvrWP3Ov39IOg2/HOlwgxTaB5D4xuwNuujUN8eKShXsBjo5OY90iPcug4sRaTe1vdOh+epCC2oE69fdRMW7E1wdzIe30//7R7Fk1pn7ctCV4P3QfDmjh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062105; c=relaxed/simple;
	bh=b5ljPf0qNs3u5yESNj2pTSmaBxSFIlMWpBDMeoMqWcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCk98HTRtYmCR9aoOoTfPZo+lKVP7Ucr7gwzMOmwWP+N3W5c3I1zkcIdIrQHvUIJ0W2FO3YXHZ4Yp8fRu8DWeVu/kMpl1JBpKz9Midhk4a6CmEST0wv0gN+bzsn01+64uuUzJpQijPPabSKOD4/abLFXym8r3rfnwTvXHqfLGxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dvqjejD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A89AC4CEC5;
	Wed, 11 Sep 2024 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726062104;
	bh=b5ljPf0qNs3u5yESNj2pTSmaBxSFIlMWpBDMeoMqWcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvqjejD7SMddPseEE2s6XQSvTJW+Vzfm0pCyQEQNoIiLKNKJoFQESMOgisgEvxu+z
	 N0SNQoUcUnjlQzYg5sWhq02bo32TnhUlhJIL2CtyXzYXZdIumBgmS/D3uR0PLuviCN
	 7iSvKYH3NvlwClbrCv4C6tHQyr9cIBdKdvWboUsA=
Date: Wed, 11 Sep 2024 15:41:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH v2 0/3] Fix a lockdep complaint related to USB role
 switching
Message-ID: <2024091144-throwing-stucco-65f1@gregkh>
References: <20240905204709.556577-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905204709.556577-1-bvanassche@acm.org>

On Thu, Sep 05, 2024 at 01:47:06PM -0700, Bart Van Assche wrote:
> Hi Greg,
> 
> This patch series suppresses a lockdep complaint about recursive locking
> that is triggered by switching USB roles. Please consider this patch series
> for the next merge window.

I already took this commit into my tree for -rc1:
	https://lore.kernel.org/r/20240822223717.253433-1-amitsd@google.com

It's almost identical to yours, but you are messing with mutex states
here, why?  I'll be glad to take a series on top of that one if you can
describe why this one is "more correct" that that one.

thanks,

greg k-h

