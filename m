Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32F9115A84
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2019 02:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfLGBJA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 20:09:00 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36935 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLGBJA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 20:09:00 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so9584099lja.4
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 17:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xp39wpo5AR+pbRP/tZoeRSZICS3SHzWRMfhJEvbxIGA=;
        b=F9QgFlzOLVDvV/NH9kO5C38Tw6X+Hr1zV9nvDrPtaW9IdmdHU1TNQTmWgtmr08QLWs
         m/LzPoUZk/NRRXSGyCni67pyjPAjI1csctIc4AcmS9vEoOX/8bco5LDaWzkI+5Pvvxsm
         tA5h/kF2wpsxbPSmFh84K3eYpHR4dbqT6qkZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xp39wpo5AR+pbRP/tZoeRSZICS3SHzWRMfhJEvbxIGA=;
        b=VT/Yf5L+pAUdjhFo8yPF5khGdWS8N3bkk585sJ4ndvaTHXkxATMO5TtDI6Cql4Vuvg
         cgnnsPmcsVD+pmxNmmxLYjICbaP/0XZ3cErZ6eR9wj3dMK8YoMMdnKHzCjbYzp6a+q09
         3UtRlMzsMM7lQSeR4paG0J3e87nx2/5VgBONTknvQPK/jjwMTlp8AV7bMnW6T/mylWnJ
         lYvZClgdgIrmAsPzuBq5pIlKQWQgJr+znvMCbXBUTM43LqW2TY6SUAnuUcDNxmfd1rUA
         rd4sMoJ+f1GJMQJ5bsujcCRIvbr08RLGOLtLPC08waAYibKnWkfXXc5qy+q3BPoNTa8G
         vRcg==
X-Gm-Message-State: APjAAAUcY+wadi8hW35A+pQBbkZwcswKZwN73QgJjSoDULpJXlElZje1
        beWX+L4TMPX2p3m7vfLQwVwBIeXYCw8=
X-Google-Smtp-Source: APXvYqxg4iVjKCptXbZaSq7MQVonPZ2i5jpjw1by+Jg6D76yYMbcv+J/LJpZAcdYYv08XLYmAP7Idg==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr10750828lji.214.1575680938339;
        Fri, 06 Dec 2019 17:08:58 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 30sm8440649ljv.99.2019.12.06.17.08.57
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 17:08:58 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id r14so6615714lfm.5
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 17:08:57 -0800 (PST)
X-Received: by 2002:ac2:555c:: with SMTP id l28mr9400181lfk.52.1575680636244;
 Fri, 06 Dec 2019 17:03:56 -0800 (PST)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk>
 <20191206214725.GA2108@latitude> <CAHk-=wga0MPEH5hsesi4Cy+fgaaKENMYpbg2kK8UA0qE3iupgw@mail.gmail.com>
 <20191207000015.GA1757@latitude>
In-Reply-To: <20191207000015.GA1757@latitude>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Dec 2019 17:03:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjEa5oNcQ9+9fai1Awqktf+hzz_HZmChi8HZJWcL62+Cw@mail.gmail.com>
Message-ID: <CAHk-=wjEa5oNcQ9+9fai1Awqktf+hzz_HZmChi8HZJWcL62+Cw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] pipe: Use head and tail pointers for the ring,
 not cursor and length [ver #2]
To:     Johannes Hirte <johannes.hirte@datenkhaos.de>
Cc:     David Howells <dhowells@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 6, 2019 at 4:00 PM Johannes Hirte
<johannes.hirte@datenkhaos.de> wrote:
>
> Tested with 5.4.0-11505-g347f56fb3890 and still the same wrong behavior.

Ok, we'll continue looking.

That said, your version string is strange.

Commit 347f56fb3890 should be  "v5.4.0-13174-g347f56fb3890", the fact
that you have "11505" confuses me.

The hash is what matters, but I wonder what is going on that you have
the commit count in that version string so wrong.

                   Linus
