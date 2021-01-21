Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAE22FF862
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 00:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbhAUXEd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 18:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbhAUXE2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 18:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611270174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AaoNvvaOoPteokGDzNbGYaURTMZC4GeGALMPHr9xXEA=;
        b=bPF+ozAiPHZQdhe62w2pkqmqAvpv+O1cf1DKzE0Vy9NTD9dRwrBJG2Y0ADzgiN6MljoCM/
        2A+EbkEw5g+jAoA9ftb9Z8lIPAzIOBpHp1PZZVbBVijEjzhGB9CHQAFRQfPBV5flxYto2R
        PQfEWdleuRZ9Y5zZ7gmjiWOqqU0uZ2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-_KzraqEdNTaCAL5lxt-_IA-1; Thu, 21 Jan 2021 18:02:51 -0500
X-MC-Unique: _KzraqEdNTaCAL5lxt-_IA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BC6059;
        Thu, 21 Jan 2021 23:02:50 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-202.phx2.redhat.com [10.3.112.202])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6895D749;
        Thu, 21 Jan 2021 23:02:50 +0000 (UTC)
Date:   Thu, 21 Jan 2021 17:02:49 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210121170249.4081af4c@suzdal.zaitcev.lan>
In-Reply-To: <20210121192929.GA12502@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
        <20210117234416.49d59761@suzdal.zaitcev.lan>
        <20210118163117.GA142198@rowland.harvard.edu>
        <20210121131954.7103881d@suzdal.zaitcev.lan>
        <20210121192929.GA12502@rowland.harvard.edu>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 21 Jan 2021 14:29:29 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:

> > I'm also concerned about regressions. This is a legacy class driver,
> > only used where CUPS is not applicable, mostly with truly ancient
> > devices. So yes, setting a zero altsetting after enumeration should
> > be unnecessary. But you never know with the old firmware.  

> How about skipping the call whenever the interface has only one 
> altsetting?

Do you mean when it's only one and not equal to zero?

BTW, one other thing bothers me. Jeremy confirmed that my patch
worked, which skips the call when USB_QUIRK_NO_SET_INTF is set.
But if we look into drivers/usb/core/message.c, the control
exchange to set the altsetting is skipped in that case anyway.
So, usblp was calling usb_set_protocol, the suspect control was
skipped, but something else caused a problem. Could it be the
attempt to clear halt that triggered the problem?

-- Pete

