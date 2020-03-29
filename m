Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECBC7196BB8
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2020 09:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgC2Hw2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 03:52:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44585 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgC2Hw2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 03:52:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id j188so11292977lfj.11
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2020 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=bqll7v1Il1DOCjojzqqOy8xLsh5T9EC3obhGSpG51pc=;
        b=IYPX0V5TVuudoBTYimCXl1ll6eGrkvmrZNDr7rZqY0zT+LyZ5efntCG1sS96ZtI7p+
         AJm+QcSsRmudyDkpnt8Wkmcm1H+kMQdlGQmBrc0Hh4vq5qngWNeyBmlb3z67EJ5tYSoN
         ooQ7ctOTd6bALIHJg2/0qjcag3mWCJtntZDMChgDvWs3DJDwgZvKSPJoBJTpCP03qAaj
         BDwpfUWexaGMwN1D3gMAxDOSZvDSNpRCs/VEsVnivjdOUNkklFjJuw9hDhVT5Ukmb+CT
         64RAjPdaawzNq2xSiErRXaiCAA/K4vnyFaxeX2rZ7/wEwh0+oBn85M/s5DOlMeDSijlw
         FicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=bqll7v1Il1DOCjojzqqOy8xLsh5T9EC3obhGSpG51pc=;
        b=me5XoDUhjGQATWFFxNiaBBEB0/sGkEuJ95ng94mQE/rBIfFLjYDSCf9f3Ke/ZaxCyj
         hOcOitvbpZsVzyq85DdQj8usbSlaXFe1A1v3DzjLY5F/vcfyluSsa/5jtC55hdvPWFbk
         GAVueBnDTNx8jYZlnklsqH/S/JZJrjONVBRFQ8unNIOTKIenXPyw5y2NvNYypBBQ4Vvl
         6Kb3Ym2PJg4RTiknIgzJ5IFoDXzSrFtXdPKo3LwN8ejgrSEm4u2GiY3y8fMM1dc32+V2
         xRaHyDDW/vFkWECs9m/cMOsV8SY2OMUKJMAIDPjbVAXhdlUVYctDTusUvL849G1m1KuR
         PM+w==
X-Gm-Message-State: AGi0PuYCH3MzI+V0brGPVwoOXv0WEkeqC0JCmRhM4UFC0zfJIOfn9U8W
        kRKpXG9UYjQM/AC5gRb7pYGTqtiEjqH/Ow==
X-Google-Smtp-Source: APiQypKVj1MszCTkva7e6dbwd95qimUbsCC67PdAA9jBrw5n5E3vuBxvJNOthgvh6+uTRjPfqh8WDw==
X-Received: by 2002:a19:48c9:: with SMTP id v192mr4715067lfa.130.1585468345879;
        Sun, 29 Mar 2020 00:52:25 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id z23sm5054900ljh.55.2020.03.29.00.52.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Mar 2020 00:52:24 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed kick_transfer
In-Reply-To: <60d30640-7d0f-d8fb-35d5-44bce15503b1@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com> <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com> <874kusgwuz.fsf@kernel.org> <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com> <87o8syf1h6.fsf@kernel.org> <08f67bc3-2941-28a2-f1fb-0a3ebdab8559@synopsys.com> <878sk0233c.fsf@kernel.org> <60d30640-7d0f-d8fb-35d5-44bce15503b1@synopsys.com>
Date:   Sun, 29 Mar 2020 10:52:20 +0300
Message-ID: <87y2rj38ej.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> If we want to add a WARN(), I think we should add that inside of
>>> dwc3_send_gadget_ep_cmd() function, as a separate patch. We can also
>>> just look at the tracepoint for "no resource" status.
>> The "no resource" status is important, sure. But users don't usually run
>> with tracepoints enabled. They'll have a non-working USB port and forget
>> about it. If there's a WARN() triggered, we are more likely to get bug
>> reports.
>>
>
> Understood. We can add a WARN() to dwc3_send_gadget_ep_cmd() in a=20
> separate patch.

I would prefer to see the WARN() patch in the same series, at
least. Care to resend with that?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6AU7QACgkQzL64meEa
mQY4uw//U5WerGBlccLAow7IBeFrAiMcrMBgQUqdZLHU8Q00EmRjj3y7b2Dp+a1c
XWNGJ2vcCQfxeUcfdqQt72pPmd/b7WQHJvdOPiZyQCvSNm4+phLmudI5pWsbZNPr
34srICDjQXjTqdf1dwGLjl466ypqT3QAVjrBBLlFSAEVVyhPBAdPB/Ypc9YTP4ND
z8qk+exkhI4Ds2IN0LOtd7YO6UVt6lCs0mFW8/cWUI6rnqcS5AnbMz5sAUSHI46v
hW87kEgHP9fmZe26CHNIYG1bZeqAJ0JCw/gHqwo7Mz7LwRAGHNY16rWV+wSGcHsP
wcZBP+L9T/yGlyl33FE5nRl2vZQQZDCW3iRDHlNl5AwO1LbsJqvEjuB9rvVAR3H9
D7cqcQ155HlYQroiEiJzcUXxI/KA0nO3mJIglKZejlBxZgr5uTO0brsMRVrQCulB
q5+XgKzfqbyJLymfy+pTk3yrex6t+DA7GqTgvzpCdPLI7yAMHpCQzDAs2daVZoq3
eESm5WCLPRGwi1QgvbHsYg21D1NWxXbUuDoQxoI/uy4mGgEsExRvY8d8qryX7ZAK
0TPBX6nAThzYtvkpfqT2AvGuq27faxoA1k3XosMrZAFjuJ3qJ9HTW//IKBqswFJX
YxoHg0MkZwrXoFgpmYDigIfwkyU1nS+s+LARADhSFBErGNWUqLw=
=S91W
-----END PGP SIGNATURE-----
--=-=-=--
