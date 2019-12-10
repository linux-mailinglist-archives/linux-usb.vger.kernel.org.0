Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F884118078
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 07:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfLJGbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 01:31:34 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:33953 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfLJGbd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 01:31:33 -0500
Received: by mail-lf1-f52.google.com with SMTP id l18so12754856lfc.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 22:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=5shTmzUfuKIhmVLnQ8kRZWthltGvpn+r/5Li0kF/BOM=;
        b=DEbZxD0hmuFnIVv1w6U1DYbXfEnjv63iekNLWYKG9xegUyuj+5MrJDR/cty1LW9U8D
         n2U4pjNoWesNn03bMk6IpE/zvHaznYhifE8iUo2wEwnNz69qm1KKMQS0EJgm6of3HdBq
         N4qdZJPVzw79yhNRQuhMkG/jQKO4JHYttPadw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=5shTmzUfuKIhmVLnQ8kRZWthltGvpn+r/5Li0kF/BOM=;
        b=qDMeJVb9iibYzYSQAW50qj7WhYRJUA2niSplAWcDYm3UZEmPU6gCxbMF2rAM/5Cybh
         23B22FGjfI00u6I4hU4yZTZVbUmeCZO9f9xksfdSuu5zsjwkp7DAe1U+Cty3JIzwzSrG
         n21k3PQHcgP+0xrdTUc5aED7xPq7GiZeDBL2ue4JGGMRap0DYAPuutgomLdj3QWL13xk
         kNYxTJYJm0lJgOgjKlkOhxZJx/cspGt1VVHbJMmf7os89gKJvqTuZmVQarLJ+wciDlpl
         y1GQBLSuFBn/jc7TAfMT5tpaG3IqQjSZRJqcdjEz5Rpm594KQYRIkdrOrOvvo+5KBTi4
         yDjg==
X-Gm-Message-State: APjAAAWYH2T1ZVs8sMwsMv9t/eSG2NRa8VVR8MoKAcHmqoa9ZyQTlZ+w
        gNtIvXBptuPOTZXfYbD/roVCAA==
X-Google-Smtp-Source: APXvYqzVkcfNL6NbCH8mIq5tkf3UWsMKHRc+84y8CP7i5s79S6rIZCfQH5/wSe2gkVXdf3GMvGj8vg==
X-Received: by 2002:ac2:531b:: with SMTP id c27mr17327209lfh.91.1575959491446;
        Mon, 09 Dec 2019 22:31:31 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id m8sm362765lfp.4.2019.12.09.22.31.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 22:31:30 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <023701d5ae77$14ec9d50$3ec5d7f0$@vincit.fi> <Pine.LNX.4.44L0.1912091024060.1462-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912091024060.1462-100000@iolanthe.rowland.org>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Tue, 10 Dec 2019 08:31:23 +0200
Message-ID: <024601d5af23$717be9c0$5473bd40$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEgy+2hV8GaGvt0FrMJEW6YCkfoGakcrpAQ
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: maanantai 9. joulukuuta 2019 17.25
> To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> On Mon, 9 Dec 2019, Erkka Talvitie wrote:
> 
> > > Ok, just to double check:
> > >
> > > I take the existing driver code (I will not apply the earlier RFC on
> > > top
> > of
> > > that) and apply one more check before the original stall check (that
is):
> > > } else if (QTD_CERR(token)) {
> > >
> > > The check that I will add is checking MMF bit && PID == IN, and this
> > > check comes right after the babble check, right?
> > >
> > > Good, seems like a simple change. Yet I still prefer to test the
change.
> > > Unfortunately that goes to the next week as we have a national
> > > holiday tomorrow.
> > > I will get back to you most likely on Monday.
> >
> > I tested this change and it removes the error messages from the output.
> 
> Great!  Okay, feel free to submit a new patch.

Thank you, a new patch was submitted.

> 
> Alan Stern

Erkka Talvitie

