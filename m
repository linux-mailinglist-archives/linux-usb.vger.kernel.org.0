Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31BF210FDA2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 13:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbfLCM3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 07:29:18 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33869 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfLCM3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 07:29:17 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so2814230lfc.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 04:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=VHgvg4M80KcRWFdpKCLgRPyd+N6aufltVMc68eJzyxU=;
        b=XB0ADAD1aQZSQkO4R18bX5XszS/O12WRWbHj1xJfRxYhBKJItsef1DttaywF19wdYN
         Ec4qpSuuG9ZSH7Kj4nyxQcOvDdTtWm1JRWI2gxnhP9HEM9ifXBJKB2ev1BY+OsKCl/10
         fxVMe01liLLdevFdbgsLDT/SaWrFy+kUcasxLlIWjFHKHonw0EJujbMKygX6J1ggrHOj
         iL5YM++Pqi82MlgAthLODf1fCbfbQdZEQjNAgeWjYCT+xXkbxEH01xP5EL5hfAkkkR/b
         SkPZaFPtaDVgG2r1HrOxKk21d5fnuXuMBjBxSbPWRkIWSYm2cheSG2Yn16vRZ5tBG0aU
         m3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=VHgvg4M80KcRWFdpKCLgRPyd+N6aufltVMc68eJzyxU=;
        b=DeMKzJ3EsM03e6Mslw19IPWt/pWu/vNKMo0TmvphmpLNjpqoeRdUWyVRlf+PxKPCIU
         4ElbkSf4ZlUCfHouTVvNafAB+JqVLuj2JnN4+cWcwSdGcfzYbCfqLTIYgRHxWV9hktLL
         ZjwJku6n7tP33jcQV8PxK11VOe7bUAHy61KAC2eEQdqNocClLBrwGlWaq8gczNHGCB3w
         X7vfQYgTfioe3InidOlUOKfxY1Eqn4NaEFS+YnaYJp2zFzCa4kjUTqG4IGUMs8ad64oe
         DW+MIra+84sCDZ5BHDlqIWi2oRa+DB5MB+QQXbqgbCrvFVJh9ByE7931/PP7pQAWdJ7r
         hGNQ==
X-Gm-Message-State: APjAAAU89N2uNvoDwKz+bdAiQYZfh3xXk5Z2T0rVKsu52nHTSEtzUu/8
        Cm95/EGRzTztl5D/znSwxDEiCX2FsPE=
X-Google-Smtp-Source: APXvYqxiFqw3u1HzX2c6NV8GXrTsXg6ifdzKxb5Zq1OLI7zedlzHFs01JQ1Mgk2ltQBaRmO4nujpkw==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr2640721lfc.130.1575376155107;
        Tue, 03 Dec 2019 04:29:15 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id e26sm1265585ljp.14.2019.12.03.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 04:29:13 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sriharsha Allenki <sallenki@codeaurora.org>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     jackp@codeaurora.org, mgautam@codeaurora.org
Subject: Re: [PATCH] usb: dwc3: Do not process request if HWO is set for its TRB
In-Reply-To: <0101016ec6294c21-99711286-dbda-4d62-b8c7-e9f28e99b261-000000@us-west-2.amazonses.com>
References: <1574946055-3788-1-git-send-email-sallenki@codeaurora.org> <1575270714-29994-1-git-send-email-sallenki@codeaurora.org> <87tv6jch61.fsf@gmail.com> <0101016ec6294c21-99711286-dbda-4d62-b8c7-e9f28e99b261-000000@us-west-2.amazonses.com>
Date:   Tue, 03 Dec 2019 14:30:06 +0200
Message-ID: <871rtla8xd.fsf@gmail.com>
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
>>> If the HWO bit is set for the TRB (or the first TRB if scatter-gather
>>> is used) of a request, it implies that core is still processing it.
>>> In that case do not reclaim that TRB and do not giveback the
>>> request to the function driver, else it will result in a SMMU
>>> translation fault when core tries to access the buffer
>>> corresponding to this TRB.
>> This is not entirely true. There are cases where driver *must* clear HWO
>> bit manually and driver currently accounts for that. Care to explain
>
> Based on my understanding I am trying to list down the two cases where
> driver must clear HWO bit manually and how the patch would not regress=20
> these.
>
> Additionally, I want to add that this patch is checking for req->trb
> (not the TRB pointed by the *trb_dequeue*) which will be pointing to
> the first TRB in the case of SG and in the case of linear it point to
> the TRB containing the data (not theextra_trb or the trb to handle
> zero length packet).
>
> *Case-1*:
>
> We are in the middle of series of chained TRBs and we received a short
> transfer along the way. Here is the code handling this case:
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If we're in the middl=
e of series of chained TRBs and we
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * receive a short trans=
fer along the way, DWC3 will skip
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * through all TRBs incl=
uding the last TRB in the chain (the
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * where CHN bit is zero=
. DWC3 will also avoid clearing HWO
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bit and SW has to do =
it manually.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We're going to do tha=
t here to avoid problems of HW trying
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to use bogus TRBs for=
 transfers.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (chain && (trb->ctrl & DWC=
3_TRB_CTRL_HWO))
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 trb->ctrl &=3D ~DWC3_TRB_CTRL_HWO;
>
>
> This case occurs only after the first TRB of the chain is processed,
> which we arechecking in the patch. Although, this piece of code has
> been no-op after introducingthe function
> "dwc3_gadget_ep_reclaim_trb_sg".This function checks for the HWO and
> does notcall the "dwc3_gadget_ep_reclaim_completed_trb" if it is
> set.Hence this condition mostly likely will never hit.

You're missing one important detail: If we have e.g. 200 TRBs in a
single SG-list and we receive a short packet on TRB 10, we will have 190
TRBs with HWO bit left set and your patch prevents the driver from
clearing that bit. Yes, you are regressing a very special case.

> *Case-2*:
> The second case is wherewe append the actual data buffer TRB with an=20
> extra_trb
> for unaligned OUT transfer. Code handling this is:
>
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If we're dealing with=
 unaligned size OUT transfer, we will=20
> be left
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * with one TRB pending =
in the ring. We need to manually clear=20
> HWO bit
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * from that TRB.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (req->needs_extra_trb && !=
(trb->ctrl & DWC3_TRB_CTRL_CHN)) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 trb->ctrl &=3D ~DWC3_TRB_CTRL_HWO;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return 1;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> This also requires that the actual data buffer TRB should be processed
> and then we areexpected to reclaim this extra_trb. If the TRB
> corresponding to the actual data (req->trb)is not processed we are not
> expecting this extra_trb to be reclaimed.

if you read dwc3_gadget_ep_reclaim_complete_trb() carefully, you will
see that we *never* touch the next TRB from inside that function. We
rely on the fact that this function will be called AGAIN to clear HWO
bit on both of these special cases and you're causing a regression to
both of them.

> So, both these cases occurs and valid only if the first TRB/TRB
> containing the dataof the request(req->trb) is processed.

yes, and your patch makes no distinction of what type of TRB we're
dealing with. In the case of unaligned transfers, we would giveback the
first TRB with the unaligned length and never clear HWO from the chained
TRB following it because your patch would prevent
dwc3_gadget_ep_reclaim_trb*() from even being called.

> The proposed change is looking for thecompletion of this TRB, soI
> don't think this change will regress the above mentioned cases.

it will

>> what problem you actually found? Preferrably with tracepoint data
>> showing the fault.
>
> Test case here involves f_fs driver in AIO mode and we see ~8 TRBs in
> the queue with HWO set and UPDATE_XFER done. In the failure case I see
> thatas part of processingthe interrupt generated by the core for the
> completion of the first TRB, the driver isgoing ahead and giving

we shouldn't get completion interrupt for the first TRB, only the
last. Care to share tracepoint data?

> backthe requests of all theother queued TRBs, whichinvolves removing
> the SMMU mapping of the buffers associated with the requests.  But
> these are still active and when core processesthese TRBs and their
> correspondingun-mapped buffers, I see a translationfaultraised by the
> SMMU.
>
> I hope I have answered your queries, please let me know if I am still=20
> missing something here.

yes, tracepoint data showing the problem. Thank you

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3mVU8ACgkQzL64meEa
mQZWnxAAhXDt9R5tNZ0E2Ip9oVEW2PNSDShwhPCo1+2YpPxHK6loXj4SEAPm9mvz
M9Mqb3veumcbQ4qGuwZR0SuwM7QxKIrXbufqG8IO3JYNVti+2l/dndPhoQXRaN/j
Th77qKxcCHLkmZ1Y3qcY7ltY/otqY9AUl1/wfEF+1NoDRzaggr0rJIVJnS0za1ys
OVDTugJ36vgJQ/IJsJ0GsH8kSDAwdF4zqKK9EvtlEjiOIy+iwstDSIBbIQVFyr0P
F0+JsQut1fEsHm0BZihQeAihVUkg9ySOSCa+C6Md5pcsCjWxeckx4Df3db7DgW1I
Mn/Nj/MX3HOeBDwGAQv7C866SqmoDrqMNlE0hV2o35Tw0YDXazBjqJjBS/GysQpi
zrBqZyQFhrKIVf85aydlgvjWtXnnu4oKB2m6L1Bhun4/I/sdMRY8I6fPbPJNQwKH
rBJulwM6yN9lZuzYj16ltQDkBM72t6WSZWZcXdsFQcZn2qkGX1IvSF+ZHcdwdF8S
MD2ed+VIXQEIcRwRDsEFFI4q8QdN0IxOHYKwpmggIbGYdWJMJXv2+tBquzi84cMW
5qccjcTwjGwy4zrf3VV98HSm2gvLKflcCJZNkCZSivvgoZgBJNDaGwiGfBXcPs+d
pDA3t1KmNmKuFAIV9iA6cEEx2zKc8heyjvtTD6Sejr1oujDn2Bs=
=UpWK
-----END PGP SIGNATURE-----
--=-=-=--
