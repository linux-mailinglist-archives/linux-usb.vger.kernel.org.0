Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE1F252559
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 03:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgHZBzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 21:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgHZBzw (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 21:55:52 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CF0C061574
        for <Linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 18:55:51 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v4so519292ljd.0
        for <Linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 18:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WELsCXwXo5F3W3bEBZjb9tn0/jpYms5qeS4RSfUShgg=;
        b=Z0vElUimKwK0F4s33sCeEPwDB+0yDwwZ9XQUVZwNoeioapiW8tCKmZl7KNIGSMyToK
         9L+j9b4p8gaafo1IrIu83B9uhC8e0SWMMARjoT8xnUlf2vfcWBberR99+7AGZdWUAWvd
         QxfjYPAHkaY6zq/knOVCfBRPfZ/Pkb/RXadyax/HC2INoJq7qaomz5ORhTUUGoJTsAph
         obaerId5jEfWHXn4mHPwwhqRYH9/PSqj2bNDmph+WYxPWpfRZLPBgestCZVCo0ZsNoOg
         vydGsd/B8qBcryFSMKpe1NCN3ennEXr8czBSGb4Iz/SbGSXsRgfUNrAgLfLv2qfo//zO
         bUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WELsCXwXo5F3W3bEBZjb9tn0/jpYms5qeS4RSfUShgg=;
        b=iv4cXnGhUOLHnJcxkho3qgZ0v2RkxuXbO1ybfBBGmPEJMbBqJF3/IFBf3MVAT3F9nJ
         A04lxSZ9dy6SPeEsU4lWSGOybJXSAkbYmWEJTrzmLLHbmzfG+VOPc3BFHt4rcj8YdvfS
         nsE4M3hflZdzsSWTEb/xL9mU8FkPOK0ZL2WpsSjwDNcarRCzcssdwIute2mW2tjF+A2W
         coUslUYxezWoyY3lVG5udSyJQUUu+iSyFnGgQlFk08U59GRLnzPvPHXVUASgEBmw45Il
         ELy2GokvqFIrdJc8TQBWTQU5IyFOFPREacstmX8GAyutj6uCyJin+TIjaHTPrbsiBQat
         ZvnA==
X-Gm-Message-State: AOAM5323PMtw+n96RCCHU6cx3ngb/CzaG+OmEGGo59oUKg3i5WaitAar
        lwZcYC4sRj1EWp6elYcZYxqLPRUsL7ZujhGjXFsc/isAhKqtHQ==
X-Google-Smtp-Source: ABdhPJyNq2yBdZu1E9mX80b2GTywN+507B/tccofM0K1oeP7TvPh6L5wG3XdQDNFty3s6jk3upNp7G8P8ibcyXLmKx0=
X-Received: by 2002:a2e:9516:: with SMTP id f22mr5632590ljh.24.1598406950298;
 Tue, 25 Aug 2020 18:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
In-Reply-To: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 26 Aug 2020 09:55:38 +0800
Message-ID: <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
Subject: Re: Linux Crash with Gadget serial driver
To:     GARG Shivam <shivam.garg@thalesgroup.com>
Cc:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 1:36 AM GARG Shivam <shivam.garg@thalesgroup.com> wrote:
>
> Hi All,
>
> My Device is a Linux machine that is having a Gadget Serial driver. Physically device side we have USB-C port while at host side we have USB port. This device is used as COM port to access the serial port.
>
> My Device side Linux is getting panic as soon as I attached the USB to FreeBSD. Any view on this?
>

You may post your panic log and kernel version info as well.

Peter
