Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3EB34A4AD
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 17:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbfFRPAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 11:00:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34103 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbfFRPAc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 11:00:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id p10so7859521pgn.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:organization
         :in-reply-to:reply-to:address:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pRN1/TUPKjEezaLj5P0gr5AykiqYiZwYuN1OnEUTX9s=;
        b=lI33axV7DzHCdzlgY2M88nw5TqQbHqMFSAGDFsXaaF2HzOX5BpGQZXoDlBEmhVkxHk
         sNL1Em3x8g5s0MhWQsvLu4Qjda3pIn2u9O8Pfe50gIlZWKjLAxdNZEMWuDC4TCNXfZ3b
         Uce4ztsJb0Q/P9tY2R7GfZgcoVL6STjiH6GaeQ0n/Hh8EbL6Iz5cy0YDyUTejpVnLVEk
         suLkiQ/qtOaIXqfPvt+e3qdLAILvr5UDyihxKs59i4orbTQNLMXRHQi45ayiICPzSJKG
         g6TRvfcZjk8kOgLdZWhZqn7V+Jpc/R7iwA/Vk6xLfNLp+SMKhrX0V6z7Z2FHYHlzsEHF
         mGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:references:user-agent:from:to:cc:subject
         :organization:in-reply-to:reply-to:address:date:message-id
         :mime-version:content-transfer-encoding;
        bh=pRN1/TUPKjEezaLj5P0gr5AykiqYiZwYuN1OnEUTX9s=;
        b=tAoG7wEVzgeWvtoxbxdBvpM9c0j6J5rC01MFosxt1rLXIbpRQ5GWWj0OiGI/ozCNOD
         +s7TYCifex/NB4o4F/fwACoAuWeYtvZvYQ7xNbdZ/tauUKtyhMK3ZY3mx1ifLeI4WoYQ
         TtN1Nb463T+E3Tyf4KdqTKuQQWz7Xye+4bQnqG/Xnup+Egya2nrdSkBtQ/2y5C0xTW61
         Zt3Ed4Agp8S323d18/FPQYD9htNHKUUz346P7PjZOJhcEkGI3Pg7BOXvWJBoRWfD5xyO
         R+DworkEzrGshsn+rILqrtMIUA5Q7I7vg2VCreSfpE3zDQZ0K6ZNRZmnODFripsJGMKK
         KsUw==
X-Gm-Message-State: APjAAAVIhtbhMKoAXybmsPsYFZ/zc72Ewj32Ps92Hw+bXg/s9+hxt1By
        RhtCpMlB493Ow+zyuGproV4=
X-Google-Smtp-Source: APXvYqwPcKmzy4pRkiOzixpk6wQLDC+XP5LO+jCa5OzDZaonVkQqazQ0aTJsxbdW79aiBjNtY8yNTA==
X-Received: by 2002:a62:a509:: with SMTP id v9mr119137331pfm.82.1560870031594;
        Tue, 18 Jun 2019 08:00:31 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id w4sm15674411pfw.97.2019.06.18.08.00.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 08:00:29 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id AA19C4650F3; Tue, 18 Jun 2019 08:00:28 -0700 (PDT)
References: <20190617233050.21409-1-dmg@turingmachine.org> <20190618064905.GA22457@kroah.com>
User-agent: mu4e 1.0; emacs 26.1
From:   dmg <dmg@turingmachine.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Replace a < b ? a : b construct with min_t(type, a, b) in drivers/usb
Organization: turingMachine
In-reply-to: <20190618064905.GA22457@kroah.com>
Reply-To: dmg@turingmachine.org
Address: dmg@turingmachine.org
Date:   Tue, 18 Jun 2019 08:00:28 -0700
Message-ID: <87pnnbj5v7.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Greg KH <gregkh@linuxfoundation.org> writes:

> On Mon, Jun 17, 2019 at 04:30:50PM -0700, dmg@turingmachine.org wrote:
>> From: Daniel M German <dmg@turingmachine.org>
>>
>> Use min_t to find the minimum of two values instead of using the ?: oper=
ator.
>
> Why is min_t() needed for all of these and not just min()?

The use of min triggers a compilation warning (see below), which min_t is s=
upposed to
address (from min_t comment: 'min()/max() macros that also do strict type-c=
hecking.. See the
"unnecessary" pointer comparison.", from include/linux/kernel')

   In file included from drivers/usb/misc/adutux.c:19:
   drivers/usb/misc/adutux.c: In function =E2=80=98adu_read=E2=80=99:
   ./include/linux/kernel.h:818:29: warning: comparison of distinct pointer=
 types lacks a cast
      (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
                                ^~
   ./include/linux/kernel.h:832:4: note: in expansion of macro =E2=80=98__t=
ypecheck=E2=80=99
      (__typecheck(x, y) && __no_side_effects(x, y))
       ^~~~~~~~~~~
   ./include/linux/kernel.h:842:24: note: in expansion of macro =E2=80=98__=
safe_cmp=E2=80=99
     __builtin_choose_expr(__safe_cmp(x, y), \
                           ^~~~~~~~~~
   ./include/linux/kernel.h:851:19: note: in expansion of macro =E2=80=98__=
careful_cmp=E2=80=99
    #define min(x, y) __careful_cmp(x, y, <)
                      ^~~~~~~~~~~~~
   drivers/usb/misc/adutux.c:382:34: note: in expansion of macro =E2=80=98m=
in=E2=80=99
                        int amount =3D min(bytes_to_read, data_in_secondary=
);
                                     ^~~

[...]

> Can you break this up into one patch per driver?  That way you can
> include the proper maintainers/reviewers when you resend them.
>

I will split the patch as instructed.



> thanks,
>
> greg k-h


--
Daniel M. German                  "Beauty is the first test; there is no
                                   permanent place in the world for ugly
   G. H. Hardy ->                  mathematics."
http://turingmachine.org/
http://silvernegative.com/
dmg (at) uvic (dot) ca
replace (at) with @ and (dot) with .
