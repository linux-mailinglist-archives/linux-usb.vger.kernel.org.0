Return-Path: <linux-usb+bounces-9710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7780D8B0834
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 13:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADCB4B2192A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 11:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A2415A484;
	Wed, 24 Apr 2024 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNmBD34T"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798BB13DDD9
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957399; cv=none; b=BJr9ucE8v3bdK5BbpPhUkbov/4uJ65AE9n30ZWeqkqfiVUPsSg9fYQ/2SlhCyLNaWr1J3LHO+hsi+SPQv90iP6VZGQtLsXMCpEdpnhpSAO4nkJl0+nNklDZWuLi+TiKnKqJ1gg5IyPXvvAPEiM8pvXmLsCRpeIrc4SfCNNMcxoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957399; c=relaxed/simple;
	bh=RcxueNsxiAY1tX4dT4L3GcGMvKSKo+bwRBnPYs75U8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsN2AwN8NPxZ2zZIyDmJiDEmshKBKSJ0seaeuRPZ46wbsNeUB6DlkxcjoROuRrs/9/GuIt08XDumXVS3fmyprQwsus/aaSl2fvFHL/+jF24Y9XOJqmQ9NrE2BVFYZF9WadmqzlFD1+IZkhO1CPSdhVA8uFTBcGJnBIjB8hMoz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNmBD34T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713957396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYmO/M9Ur/Qfkgn9LUApbJZOelOP5x9iOICHoNUu/8w=;
	b=fNmBD34TAFDHR+k3mZbs/PeJ0S3TFJs3ML1D1Ew338BU2NT1boBl3hupgu0FzIaJ4HzE+B
	1TTVrbUfGAXDn2LyaAz/fIQO1jzKRIvHTk6SHFpY7hU7N5du+eC/httvhwJWUl82G8dbEQ
	uJyGnwxdgv5tud9jDEZuhYTGg1NLnPg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-kBUq7rhJMLiaNw4t81ocNg-1; Wed, 24 Apr 2024 07:16:32 -0400
X-MC-Unique: kBUq7rhJMLiaNw4t81ocNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD63F104B503;
	Wed, 24 Apr 2024 11:16:31 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.39.192.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CE99EC682;
	Wed, 24 Apr 2024 11:16:31 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
	id 168D6F6235; Wed, 24 Apr 2024 13:16:30 +0200 (CEST)
Date: Wed, 24 Apr 2024 13:16:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: Problems (timeouts) when testing usb-ohci with qemu
Message-ID: <edfmff7qm46edap6nz2ppvfhcw4jp6ahjltrv76jsiq5rhz5hw@v2lcbclpdsjt>
References: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

> qemu hack:
> 
>  hw/usb/hcd-ohci.c | 11 +++++++++++
>  hw/usb/hcd-ohci.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index fc8fc91a1d..99e52ad13a 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -267,6 +267,10 @@ static inline void ohci_intr_update(OHCIState *ohci)
>          (ohci->intr_status & ohci->intr))
>          level = 1;
>  
> +    if (level && ohci->level)
> +        qemu_set_irq(ohci->irq, 0);
> +
> +    ohci->level = level;
>      qemu_set_irq(ohci->irq, level);
>  }
>  
> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
> index e1827227ac..6f82e72bd9 100644
> --- a/hw/usb/hcd-ohci.h
> +++ b/hw/usb/hcd-ohci.h
> @@ -52,6 +52,7 @@ struct OHCIState {
>      uint32_t ctl, status;
>      uint32_t intr_status;
>      uint32_t intr;
> +    int level;
>  
>      /* memory pointer partition */
>      uint32_t hcca;

Phew.  Disclaimer: Havn't looked at the ohci emulation code for years.

It should not be needed to store the interrupt level that way.  It is
possible to calculate what the interrupt level should be, based on the
interrupt status register and the interrupt mask register, and the code
above seems to do exactly that (the "ohci->intr_status & ohci->intr"
bit).

ohci_intr_update() must be called if one of these two registers changes,
i.e. if the guest changes the mask, if the guest acks an IRQ by clearing
an status bit, if the device raises an IRQ by setting an status bit.
Might be the ohci emulation has a bug here.

Another possible trouble spot is that the timing behavior is different
on virtual vs. physical hardware.  Specifically with the emulated
hardware some actions appear to complete instantly (when the vmexit to
handle the mmio register write returns it's finished already), which
will never complete that quickly on physical hardware.  So drivers can
have race conditions which only trigger on virtual hardware.  The error
pattern you are describing sounds like this could be the case here.

HTH & take care,
  Gerd


