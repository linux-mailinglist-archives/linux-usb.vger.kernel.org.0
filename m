Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B437919BEF1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 11:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387633AbgDBJyG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 05:54:06 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42961 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgDBJyG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 05:54:06 -0400
Received: by mail-lj1-f178.google.com with SMTP id q19so2515187ljp.9
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2020 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=SdVB86okpAJ0iXwD1TL4a7g3WstPRwWpBx7L+qoD80I=;
        b=WI2tO1JDiuQxzMmoqdRNBiqd8n97Llj6uErfRzqCFQ/sEKpdRJqtdEVGVVgf+uM1cI
         dXHt46HJj9t1rTJMIkn9XLcfyTX+605XUcthe43gk1h3lfzCCGNHXyXchKqEBQCnUkLA
         v4c27rKFxtS4jaxz9UEKEJ4iJnJltO7jwNJqZfd+3nK/uwsGnmE07mm/1N0lwGfoB9us
         PLT3czufs5/WFyfyZtXAA/BTikz+B1KaT1AtC4N4fFKz6ww/1/qby4fgSVBMBGMc6s93
         /lC0FHh9ciHQmRan61Q86pwawkk00X1pzQcuYS1t/WAJqKFFcDQIknrN+Kh54bN3CCmS
         6lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=SdVB86okpAJ0iXwD1TL4a7g3WstPRwWpBx7L+qoD80I=;
        b=F6wM8FHs1GKYk3nbWz/ebP20BGNvmwUWn9f+mgzbTwdqBnwufWAwnjB4iwyMoGA3Ih
         CRzVLgBrP0mWFucMMaYtUXQl+Egvry14dcNr0+LssMFNv+go3U7omA0pfFBexwmIfFvQ
         VZ7dbImGHjp89BtcxRFv/IpKUndXUaw3SI0KloLFKmHco6aq0kMoX7a1V8W5oxKgvXEQ
         LOAD0jV2GErfz7oHR8OxBn5pWeKk8ZIFk/Z9R1X8och6iIGgBI/Y6F0VkJfd/Z8VJ57Q
         HEaM8dbbzrA7+W8TMXlZzIPfdOTazgKG1yD0oBgdsKjs1P80ymiyLGmwpR6OuPyqUFQk
         4FiQ==
X-Gm-Message-State: AGi0PuZglb00NlcPxFAAcMz64MmEkYayWrI/G8ditzouMYpiwiT9ESIH
        fZ2jwXfaCts0xjlDlUxpPApje+8OvBQ=
X-Google-Smtp-Source: APiQypIVqsbhSSNPlWX4hxrTs6wHnkLFW/3Ni7szMNhO5rT8jN1yM/KbEa5pu8VkblmakUFuB/GINw==
X-Received: by 2002:a2e:1647:: with SMTP id 7mr1490511ljw.177.1585821243691;
        Thu, 02 Apr 2020 02:54:03 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id f9sm2921824ljp.88.2020.04.02.02.54.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 02:54:02 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sriharsha Allenki <sallenki@codeaurora.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: Fwd: [DWC3][Gadget] Question regarding the unmapping of request as part of queue failure
In-Reply-To: <f76b1964-ee15-8076-2575-4f533fc53244@codeaurora.org>
References: <0105a5cd-936e-fb08-77bf-c2f1dbf0aeed@codeaurora.org> <53a4614f-d1bc-5856-8e01-eb790a6ff7fe@codeaurora.org> <87369skhdm.fsf@kernel.org> <f76b1964-ee15-8076-2575-4f533fc53244@codeaurora.org>
Date:   Thu, 02 Apr 2020 12:53:58 +0300
Message-ID: <87pncq9ps9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Sriharsha Allenki <sallenki@codeaurora.org> writes:
>> Sriharsha Allenki <sallenki@codeaurora.org> writes:
>>> I was looking at the code flow for ep_queue and came across the
>>> following piece of code.
>>>
>>> __dwc3_gadget_kick_transfer {
>>> =C2=A0
>>> =C2=A0=C2=A0=C2=A0 dwc3_prepare_trbs(dep);
>>> =C2=A0=C2=A0=C2=A0 req =3D next_request(&dep->started_list);
>>> =C2=A0=C2=A0=C2=A0 if (!req) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dep-=
>flags |=3D DWC3_EP_PENDING_REQUEST;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn 0;
>>> =C2=A0=C2=A0=C2=A0 }
>>> }
>>>
>>> As part of dwc3_prepare_trbs(dep), we get a request from the pending_li=
st
>>> and queue to the tail of the started_list. But here we get the head of
>>> the started_list, now if there is any failure in issuing UPDATE_TRANSFER
>>> to the core, we unmap this request using "dwc3_gadget_del_and_unmap_req=
uest".
>>>
>>> But if this kick_transfer was part of the ep_queue and we have failed
>>> to issue update transfer, instead of unmapping the request we are trying
>>> to queue, we will be unmapping a different request (first in the starte=
d_list)
>>> which the core could have already started processing. I believe we shou=
ld unmap
>>> the request we are trying to queue but not any other.
>> no, we have to start requests in order and dequeue them in order as
>> well. There's no way to verify that the request is already processed by
>> the HW, other than checking HWO bit which is set during
>> dwc3_prepare_trbs(). This is a HW-SW race condition that we can't really
>> fix.
>>
>> It is minimized, however, by the fact that, at least for non-isoc
>> endpoints, we use No Status Update Transfer commands, which means the
>> command can't fail.
> Thanks Felipe for the reply. I see that this is a trick race condition
> between HW-SW, I have seen one occurrence where ep_queue from f_fs has
> failed (at kick_transfer).And since Asynchronous IO has been enabled,

what the reason to failure? Capture the debug data and send as a reply
to this message. Method for reporting bugs on dwc3 is documented.

> the request was freed leading to thecorruption of started_list because
> the list_del and unmap was happened on the requestat the head, but the
> request freed by the f_fs is at the tail of the started_list. This
> caused a use after free issue.
>
> Please let me know your comments.

No comments, really. I need to see debug data from dwc3.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6FtjYACgkQzL64meEa
mQYenhAAtEhTPlwd0RHdPdLgm77LZTaIfaE84I7bEsHRy99Z95+0DGlcxxzR6def
noG1xLW1OmxC55Ilx5JK4azxMF18AgG3WlvoORU7vvk3VXeB1YZFVTcnZwG6cA7H
tyfYr+5NXURaszIZ0sHmoXuZdyyn9rrAH+LKxhCvYq6NiIBImgDlhyRF7bBVfYXY
cVjsuQZ87L1j1D0rm0OWJJMjX62UkkhyOJxksRAWptQiFGwn7IY16HW0yLWQh+Ve
WCvRAOE9HjWSO+/RfJqqrHFe7afuK3vY4kLfhVagtezPMIEhA/cwMenNsmL0PTMd
/BSWFoxsgGayx8Nq48QubsPUTn8aSDAEbfNXBe2fBDZX91q3btPZLs4fjsZcKq3R
Wvw1BJG6scrf3oTdiPYTiAJWewTYtja5OZyTpqSFjlIymp/CzqT/5uYhxwZYc7Zs
wrcuIsy8+wOiQT+97qzlbcN++AxbThGdtlzqeEXJxj7fF2ryr2jjhX7j7J59CwtC
oYk5DtsOJvGm7wxO/KNNwcQFvywYV3LduKXq6bPGF8TX+xSIssJqnEl9l1QaSudP
RuHKjdH6oknpilAR5TFRYSCHVz/FVNuH8z3uL2nqUmpVVKwFOwr8BPJXER8aXJT4
BuHgQIA6kGyqNez6yZUlGAIHANOmMRUgTOP1oVuLdFcYkweyNZQ=
=ibbP
-----END PGP SIGNATURE-----
--=-=-=--
