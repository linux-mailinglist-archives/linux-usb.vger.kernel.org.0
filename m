Return-Path: <linux-usb+bounces-29011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B1BC43CE
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 12:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D9340196A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 10:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FDD22D7B0;
	Wed,  8 Oct 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1GbaXc7h"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E101F936
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917854; cv=none; b=Yu/+XIObuKzvgGS742PFuANz+jZh35Ax06iRzDf2/rIrm+zUT9BaVCLA69hc2PLwEH8BhnPv5eqm4s7RDKQbncJrRq/zFk5uvEYydLfb7xODOJ3sB2pCHBwxc3/f1BveJ1Bf5vC2pjVjWjoVe5LxVLEhcKl+mCklcoNGpdDHRVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917854; c=relaxed/simple;
	bh=Lr68CCaMmUVa629HZ8NDHjmp50savQ/Okgs3FxE+UaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J37AjT2ZB86nPLRcw+Zj1slSVv5o+REs7w1HjvNMs+MThnS5l2HHNqxhnrlAOlxrEKuWEHwhlTUofOKMBUV1h9fRtkmskmPhDnhn5s4kYAi1lA09LP3k2wPw26mlNuEhXjx+ejehcxW7ptGm4rqrhyNrLjqfNDbV/ruhFkVbcjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1GbaXc7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CC7C4CEF4;
	Wed,  8 Oct 2025 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759917854;
	bh=Lr68CCaMmUVa629HZ8NDHjmp50savQ/Okgs3FxE+UaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1GbaXc7hM5HifHDihdutYJQl79IVPp2A+S29z6WAW3uirpwgTIThEV7d1M7SnBdF0
	 oEggNKTXEQYzxp6r2Rr6kiTC3zhSsiUCZu0stqmtTY4BmfcY+zf4C7APh/RPZezvau
	 DHMDlZXSa/dvlb029uEiVU/cIyfOWbIUqBGG/5q0=
Date: Wed, 8 Oct 2025 12:04:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ShiHao <i.shihao.999@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5] usb-storage: Simplify protocol translation
Message-ID: <2025100845-engraver-perch-dabb@gregkh>
References: <857a1b63-83d9-402b-a9cd-8aca0616c517@rowland.harvard.edu>
 <20251008070420.8302-1-i.shihao.999@gmail.com>
 <2025100836-uncombed-blaming-b77a@gregkh>
 <aOYsQ8EGBUOebDDi@fedora>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYsQ8EGBUOebDDi@fedora>

On Wed, Oct 08, 2025 at 02:48:12PM +0530, ShiHao wrote:
> On Wed, Oct 08, 2025 at 09:31:59AM +0200, Greg KH wrote:
> > On Wed, Oct 08, 2025 at 12:34:20PM +0530, Shi Hao wrote:
> > > Simplify protocol translation for usb subclasses.
> > > 
> > > As suggested by Alan Stern  to remove the switch case labels  with
> > > 'default'  or keep the  previous  if statements  instead of the switch
> > > cases and advised  reasonable value when cmnd[0] >= 0xe0 .
> > > 
> > > keep  those usb subclasses to default and simplify logic removing
> > > switch cases and set 6 as a reasonable value when cmnd[0] >= 0xe0
> > > which fallbacks  to value 6 which is old cmd_len for those subclasses.
> > > 
> > > Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
> > > 
> > > ---
> > > 
> > > changes v5:
> > > - Reformulate as  v5  of original patch series
> > > - No code changes ,clarified versioning history
> > > 
> > > changes v4:
> > > - Simplify  protocol translation logic
> > > - Set reasonable default when cmnd[0] >= 0xE0
> > > - Remove switch-case statement
> > > 
> > > changes v3:
> > > - Wrap  commit message lines properly
> > > - Improve commit description
> > > - fix  checkpatch.pl script errors
> > > 
> > > changes v2:
> > > - Update subject commit message
> > > - fix  checkpatch.pl warnings
> > > - match from: and sign-off: name
> > > ---
> > >  drivers/usb/storage/transport.c | 21 +++++++--------------
> > >  1 file changed, 7 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> > > index 4d01f70f39ac..14cc608052d9 100644
> > > --- a/drivers/usb/storage/transport.c
> > > +++ b/drivers/usb/storage/transport.c
> > > @@ -719,17 +719,9 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
> > >  		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
> > >  
> > >  		/* Protocol translation per scsi opcode group */
> > > -		switch (us->subclass) {
> > > -		case USB_SC_UFI:
> > > -		case USB_SC_8020:
> > > -		case USB_SC_8070:
> > > -		case USB_SC_QIC:
> > > -			srb->cmd_len = 12;
> > > -			break;
> > > -		/* Determine cmd_len based on scsi opcode group */
> > > -		case USB_SC_RBC:
> > > -		case USB_SC_SCSI:
> > > -		case USB_SC_CYP_ATACB:
> > > +		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> > > +				us->subclass == USB_SC_CYP_ATACB) {
> > > +		/* Determine cmd_len based on SCSI opcode group */
> > 
> > Always remember to run scripts/checkpatch.pl before sending changes out
> > to others :(
> > 
> > thanks,
> > 
> > greg k-h
> 
> 
> Hi greg ,
> 
> Thanks for the reminder. I ran scripts/checkpatch.pl --strict on
> drivers/usb/storage/transport.c and all checkpatch.pl has been
> resolved .If i need to make another patch for this new change
> please let me know .Once again thanks Alan stern and greg k-h
> for reviewing and giving your precious time .

The comment is indented to the wrong level here in your change.  So
as-is, I can not take this patch, sorry.

thanks,

greg k-h

