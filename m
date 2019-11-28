Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3671610CE75
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 19:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfK1SSn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 13:18:43 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38586 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfK1SSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 13:18:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id k8so18850937ljh.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2019 10:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V1/OkAFoqdX8JUtP/cz56ULwb5N5BMa0VRFRz3FCIgM=;
        b=OGJn1VPsc+goTYv/cpN4dEWGj+AXMGWL9XbZOADTEnF71qUMyP2A5sE5fk1p8zmydX
         xrGDpeDXG5c1MmpT6uoSNpsybALlODM2eC8550U3Bs9c55qFZ5UPP21GvMBcCV1BZrGG
         xH6ddlPBz8eNsTumfv+5CfwF+QW4G24DZteEbufM3gvZfmmQX0CQuMKDJIAMQ+lMPO/t
         EHilyqYx904jV9YfpHD5bTSjrqJUUGnV92Jxwl6uz1pYnR5yK1J2/+olC6TRN2UncBvN
         qOBajyJ2gvHW9dhG+tyraexJtarYoCv6nYHBcRaWnP79TRKkOaXDj5Tq2vK0v+MgdU2C
         UyqQ==
X-Gm-Message-State: APjAAAVyKaBPRiUBE7JgmGqJD4RDb+UC6aHhKWo3AYiuDPGvBbiE/22c
        y8iWhfVS3S9QVDKE/kTCaI7XHz//
X-Google-Smtp-Source: APXvYqxd0gJ/v075swI3cUJR5GPiTUFt37Ll/8woEG7vpaZdwvpCIn1zc00tqz8fSfKR/rD7MgiWQg==
X-Received: by 2002:a05:651c:1059:: with SMTP id x25mr35904268ljm.255.1574965120947;
        Thu, 28 Nov 2019 10:18:40 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id j21sm8852213lfb.35.2019.11.28.10.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 10:18:40 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iaONE-0001UR-Fa; Thu, 28 Nov 2019 19:18:40 +0100
Date:   Thu, 28 Nov 2019 19:18:40 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191128181840.GG29518@localhost>
References: <20191118133251.21401-1-dnlplm@gmail.com>
 <CAGRyCJFXL=ZOUpt6bi=g0tmN=A7bsnemPx-sMczu8bQCYK7pdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJFXL=ZOUpt6bi=g0tmN=A7bsnemPx-sMczu8bQCYK7pdg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 28, 2019 at 07:12:31PM +0100, Daniele Palmas wrote:
> Hi Johan,
> 
> Il giorno lun 18 nov 2019 alle ore 14:32 Daniele Palmas
> <dnlplm@gmail.com> ha scritto:
> >
> > Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> > to be sent if out data size is equal to the endpoint max size.
> >
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> > ---
> 
> Just to make sure that this time the patch arrived properly.

I got it this time, thanks.

Johan
