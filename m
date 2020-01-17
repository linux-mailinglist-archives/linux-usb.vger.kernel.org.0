Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2772140326
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 05:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729394AbgAQEsk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 23:48:40 -0500
Received: from mail-vs1-f43.google.com ([209.85.217.43]:39846 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgAQEsk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 23:48:40 -0500
Received: by mail-vs1-f43.google.com with SMTP id y125so14121667vsb.6
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 20:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YYXtbJm0fDGzv1SIBataC5Iw13JQ7iA1NKcsJs8Dmww=;
        b=DolfrALqzAtZuAhizba8JL3nc3my+gxJ5SsT/f4fCeb39hjCBQbHxcXRf2DLOxV8D/
         M70LXE9Zepfin+iS+JsVVe6glzcOy7DTfxDBs4dYXpHzMjOT1dcxlRL9u9hBXjctFbst
         5GtqRRHgTPi6WIe8tweWvDpUuEWd4Ly3clqOxYkmcnT8Jpf5eWcRDkRX+T/JpOeikaMX
         oe5CDTdM1NnqI1OrMQ9fz/Y9zSvjdYR/2tvaxUwAYWquaEFKmgUHi8Z/WvR6wNtFa9wy
         nLrkpYcRrHu6ijM9L6OE+VVy6CKuCXO4YdOsNzxjKijYtjgrp12JHWbFjtJN84dum2qw
         3fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YYXtbJm0fDGzv1SIBataC5Iw13JQ7iA1NKcsJs8Dmww=;
        b=WVNH+A9F1GLVcO+WKmFpBlIChzAZ9li9Bwpj5htMfxQPpRIi5iK2134k5OWSaI+jgE
         PlEs+8JAi/rAGHpVMTYKG9mj2a1XsEZ3fHaBV2CMMZSSgx7tQVv7YQYk2r3FZJe7U4M4
         Yj+56UWrM/TCV2kwE+NGteB0DrCgjG7Viy+23z3jOUePWhQqBUa+lwzccrJX+DQ6RY+K
         91TBBTRU8oC9bU1+ODIgtPjvFRw0/uLIBdeJZq7fQms8AhrJGI+d/SGvvor3dIDgvpQR
         5p5Lf6fnDmJCbHPEo/4YrdFOZQdWPuhTsZCK2u2xCSeEuxZW/cHEDRZ/wf7kH+s3rOFH
         4/9Q==
X-Gm-Message-State: APjAAAXabRRn7pYGREW6V5+R7yb7WLjTa2GSV/d79NVgVmRyAJPxyEf3
        HQ7LFXNrgwOPGjkTfV7jbfOApLlPTdwHd5g4JRQsf+Cs
X-Google-Smtp-Source: APXvYqxdRL9URUxrgoifblWb3eU5HflmgP0CoTiM5o9wn1/Gk9MQNnXNmBcwGkvzU27f5VuazxT/b0hfMlImqOAILC4=
X-Received: by 2002:a67:fc96:: with SMTP id x22mr3662542vsp.33.1579236518830;
 Thu, 16 Jan 2020 20:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:3303:0:0:0:0:0 with HTTP; Thu, 16 Jan 2020 20:48:38
 -0800 (PST)
In-Reply-To: <Pine.LNX.4.44L0.2001161656270.1301-100000@iolanthe.rowland.org>
References: <20200116214034.GA1250873@kroah.com> <Pine.LNX.4.44L0.2001161656270.1301-100000@iolanthe.rowland.org>
From:   Chris Dickens <christopher.a.dickens@gmail.com>
Date:   Thu, 16 Jan 2020 20:48:38 -0800
Message-ID: <CAL-1MmUnXtR3hgxCb0p1+CZJunBfY63soj+N8EbyvggYokfmWg@mail.gmail.com>
Subject: Re: Inconsistency in how URBs are unlinked
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[resending, hopefully in plain text]

Thank you both for your responses.  Perhaps it was luck that libusb
had worked fine until that change.  I suspect it was modeled after the
behavior of Linux at the time it was written.

In any case, you are both certainly right that no ordering should have
ever been expected in the error case.  I=E2=80=99ve patched it to not depen=
d
on any specific reap ordering.

Chris
