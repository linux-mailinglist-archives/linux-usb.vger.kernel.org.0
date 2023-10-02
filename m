Return-Path: <linux-usb+bounces-920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891F7B5167
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id DDBC92829ED
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 11:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2093D111A5;
	Mon,  2 Oct 2023 11:33:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EC6EAD4
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 11:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90027C433C7;
	Mon,  2 Oct 2023 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696246380;
	bh=nhU5cnmwct4Eu6MT28XnKgV1CgAdV+FaNhF12UQwqCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOZ5KzFF0l7WtEkdzjCfacRBw9JA1id1887wkhSO997/Pj+4Q00Mo7/keEuhQskZ8
	 tFAr1Z/bwd7X2VEdf1PRV+Rx8lsQLGJhionISwSV/MLuPAXqKYPUBaTxI5KGihU+go
	 f1V7cr2A4DYI+l8XhIewsoawbOsTIW976RvmqkiI=
Date: Mon, 2 Oct 2023 13:32:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH v2] usb: pd: Exposing the Peak Current value of Fixed
 Supplies to user space
Message-ID: <2023100241-surface-alkalize-9fa9@gregkh>
References: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928105944.1718897-1-heikki.krogerus@linux.intel.com>

On Thu, Sep 28, 2023 at 01:59:44PM +0300, Heikki Krogerus wrote:
> Exposing the value of the field as is.
> 
> The Peak Current value has to be interpreted as described
> in Table 6-10 (Fixed Power Source Peak Current Capability)
> of the USB Power Delivery Specification, but that
> interpretation will be done in user space, not in kernel.
> 
> Suggested-by: Douglas Gilbert <dgilbert@interlog.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> v2: Include ABI documentation.

Looks like the documentation build tool doesn't like the documentation
format :(


