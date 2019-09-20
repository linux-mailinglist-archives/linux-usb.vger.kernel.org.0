Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F340AB8D41
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 10:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408377AbfITIyp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 04:54:45 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34581 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405574AbfITIyp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 04:54:45 -0400
Received: by mail-qt1-f195.google.com with SMTP id 3so5352770qta.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Api0Y+wH/01dyNLRzM8HsBg+B/morFmjSPtVkLjmI/Q=;
        b=kABMGi4H+2M2eGBGHfwbOlkRX3An51O1VYIf/eU1q99g9+8P+Zy0ICpmsxfgHbZuv1
         fXTaZsMR1B3eoyPlR4Y1p29pbk7XmZjCNbBW3kJDBoO7SJgQ5qBEG2HvvlqedA9BONca
         3gxwQPdEPUEjBIRjERYTCmYjSenKj3EGziZaarpHf7awc8cNfKa1y/VSzYMALqexO74O
         MPzg6OSfvG6NNNMb9bc8luHIM/fe4UDOLAu/IFqb7JZCaKsbt4oejbPTcdlzG1HeWlRF
         UfT0YLzzJ8nFcjPI5xjtXaonJLmwL9kX4mRqBh3+kwMv4Eh5ABx+bdUQp3RUE7He14bo
         WHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Api0Y+wH/01dyNLRzM8HsBg+B/morFmjSPtVkLjmI/Q=;
        b=uS9BrhhyJ1irH4CmsZIoqYHVdKMtgPxZaeC05l1x/rWNjrx2U1wuGFUVMsKvYL2vZB
         IYtsGuvRb7g9qleOpo2w4zW6s6lK6VCHqO7U5QUquDho252/Q8XpaDz+ibEcIGWuVEDa
         c3qP3JTg+vQuOSRTkRSz1tWnlSfAV/TZ4h/jL8SCsHiPXCYuwfI+8aJ19GmOKCxDrVu/
         p+1BhQjO1S67t8Sjt8Ilra5aBcQK37+V4XrWF9o27V4G15aRcLq015DW0e/GJ3CXg+HA
         cTgPztccNjL1/VH+9LleXqmYv9d0eNbck7ZHymYA2h+kTQ7tLjozNmdzra0CATNqLXcf
         Gm+A==
X-Gm-Message-State: APjAAAUTcbSBRsMTlY3j26vSSlc0MokkLOedIjrZwZsf2+4wMhgxdxoN
        O/804KNtRf/B6p+Wo9jNjvI5pRheUgDyMHNGFVHk2g==
X-Google-Smtp-Source: APXvYqxby1MVQ81ts9SMgFhl5eszRFIhQWZZ+1I9dOTghcsQoou2a3lC1IXaWgEJgyhFiiT9WC7iy54wqz+GjKsAjl8=
X-Received: by 2002:a0c:8a6d:: with SMTP id 42mr12268207qvu.138.1568969684035;
 Fri, 20 Sep 2019 01:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190920032437.242187-1-kyletso@google.com> <cb225c94-da97-1b47-48b6-3802dc3eb93b@redhat.com>
 <CAGZ6i=3O2zLJMPY5UevjTrJJj7fxpWcn28dZYRptWES74=4Tgg@mail.gmail.com> <ce0e1163-cb0f-29ef-e071-3c0ee795a7e6@redhat.com>
In-Reply-To: <ce0e1163-cb0f-29ef-e071-3c0ee795a7e6@redhat.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Fri, 20 Sep 2019 16:54:27 +0800
Message-ID: <CAGZ6i=2=hcLcAT3kHHasapWRDpd5sNL=wenBXuMWaRZKeTEiBA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 4:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Kyle,
>
> On 20-09-2019 10:19, Kyle Tso wrote:
> > Hi Hans,
> >
> > I have tested these on an Android device (ARM64).
> > All the swap operations work fine (Power Role/Data Role/Vconn Swap).
> > (except for Fast Role Swap because it is still not supported in TCPM)
>
> May I ask which type-c controller are these devices using?
>
> Regards,
>
> Hans
>

It's a Type-C/PD controller embedded in Qualcomm PMIC PM8150.

Regards,
Kyle Tso
