Return-Path: <linux-usb+bounces-14764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F7D96E8C1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 06:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE862865BB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 04:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC31482ED;
	Fri,  6 Sep 2024 04:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="uO0hDJf+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4797171CD
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 04:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725597859; cv=none; b=ihnIpeT8ivRRa7eWyrEfjmBmsgbdVRByFUeMTHZGZGuG5fQ/jgg4Rd1biSWNsheazOa69MkZUTcNwEHybCYiVVY2hq5cuy+VWnzpcKwe84xER8bcLLM24Dl8CIJtmfKSCOmvqrJBQtwHSU3vrJB1TUxdzytqZu61WH6V13hTwhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725597859; c=relaxed/simple;
	bh=DhoLawP5JqxYWRdJaF0mfF99Q3V94cXn5EHLVJH8X/E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=AAMemZH8nFTT6RvYCo01FKFfAqejLbq9MqBPZ2P1fz93HMti6e+eW+V12DGhRnWM4/DW+uZQXZbHZNsOQgjGgn55aqq6JnbFAyds2aZvaEyLIOQDlOMEePmwH9K7Gx+WtR2CBLdvOHyve5b9e+eITH87wV+Mpq1UEWZIDbXt7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=uO0hDJf+; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1725597850; x=1726202650; i=mista.tapas@gmx.net;
	bh=pPRj+A5MkLgPFaW2IGn7+XUjJxSx0KiwFJ24jEkYKBA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uO0hDJf+iLkK35C+lnSVIWbK3bQZZCBTlQiOCJHC/nTeaxPS+yGBx5g/45UK+QRA
	 hTRZsq7q+t9Azg0BldJf4BmB2uQmeqdGiirbTqnTIulXollifwXdim+rMmbUnIS2R
	 YZwSN3SBdGXEBSL3s49JF98iqakDqjg9EKt2+v8fyrigH+GzEtEu2zZy0YBQqz+Zk
	 Lp23CMyfREV3himZ0rSib+jOEpFf8L5A8HSjTwLE9gpFVrM6WPFBT24vrAVnr30De
	 dOJZbd6v30b127ihHt8SB32Bnap30oMTpPzN+awdNLAE2qDhqLv0DbmDKf9Xl85JD
	 ME35N95pUiYd5ZkQpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([92.39.21.169]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdefD-1sDN7r1y6b-00qBkL; Fri, 06
 Sep 2024 06:44:10 +0200
Date: Fri, 06 Sep 2024 06:44:08 +0200
From: fps <mista.tapas@gmx.net>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
CC: linux-usb@vger.kernel.org, Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_10/12=5D_usb=3A_xhci=3A_adjust_emp?=
 =?US-ASCII?Q?ty_TD_list_handling_in_handle=5Ftx=5Fevent=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240905143300.1959279-11-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com> <20240905143300.1959279-11-mathias.nyman@linux.intel.com>
Message-ID: <54D5652C-956D-46DE-B58A-1718BC7C9A56@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:creY+wMEqfB0O75JFarCo5i3Ug6dz1E+VUIiy/3wfk6ozZ7UZ6e
 dzZ5Ikd/wWpAjTP2S/wSxqEMpoaItpY8HmhMll33PHYBE5ekAQN/8mWBgfcgRR0Ugr+0Cjx
 OT8+yoDu5gOKD0MVRyGVE0vyuJPfjkr1/nt9JRgCMg5dXohN3bqBbNIsLyD/OrtlTBhF8p4
 SLeJzWNM17wif/GnOhcIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wEj2ckS5bps=;YTsZD+b9kAeSDk7zqTzD8DNM1fs
 3Hr1+4lhktXRFEGvVxREA49D6qecJlv7uYz/poKYEv/RXqgo4V8k57bJ/b7lnIFSqRsHx51JO
 MO/G42bdqfqg+JqMAYQw3H1zUHLlfIq2zTmnWLWcJ+d7IxB73puzmiALp0wI2czUfqJMZ9z93
 BqHg6yNT4pBiPQ4XLaVj3Wzll5wNm9QYjlIH6ZslXpDGGgpeBIw5Jk9LnEnJ1CI7OwS/pQ6dF
 AEsyDMTOSRLTlEVtQt5xvZGbu8uTyRXWSmWYh93Hc/u3xViii3gSniSf6E9kAGegi2LC9IM20
 PoAO56JJP2BQY3Rhle/dHu/CSfF9SJ06tqaXJGGgSI+86EGeatuqdqSW6wXUEuZS3q7DAPIXF
 gHiZtP4IqBeQFysV3bnhP731hsAHcdDLWP7WKI2q5FRMhH5ryqIwISg5wY5dnIXdZxhrADdal
 njSTHqUivKINJuMsLohren932TsKI2NyK4LaPfpQ/0ac1Tmizh0FkNg9URCZd+PIgP3/iJ1Eq
 HeJhlXTvW1/xSYoAOBqHVS6uQLqzY5CrPFQerEYY5mkq2DpuxFeyGOVhLEl0B+2xmdN+1NK2T
 Rv6DdzcZep79+HfUouC1yAcHEwNYrzrlXAn3/2RIlgq3jbaW0B/nvp15udYOf29WPrQWbD5wy
 AtaFi6zIWX4wZDSYwIARljKSTNuXybES99BxbszuI82XwYtc4sSYfCVxU0uXjCGaWTUuXngmP
 ctqB2QlLQNjcHWag6kenPCOe408DaSk6TDMmMbNV6All71AqtbARK4O9a08UTmiO1Pw8RxIi/
 YJHaNtCRPlLTu/Zi+K+46muA==

On September 5, 2024 4:32:58 PM GMT+02:00, Mathias Nyman <mathias=2Enyman@l=
inux=2Eintel=2Ecom> wrote:
>From: Niklas Neronin <niklas=2Eneronin@linux=2Eintel=2Ecom>
>
>Introduce an initial check for an empty list prior to entering the while
>loop=2E Which enables, the implementation of distinct warnings to
>differentiate between scenarios where the list is initially empty and
>when it has been emptied during processing skipped isoc TDs=2E
>
>These adjustments not only simplifies the large while loop, but also
>facilitates future enhancements to the handle_tx_event() function=2E
>
>Signed-off-by: Niklas Neronin <niklas=2Eneronin@linux=2Eintel=2Ecom>
>Signed-off-by: Mathias Nyman <mathias=2Enyman@linux=2Eintel=2Ecom>
>---
> drivers/usb/host/xhci-ring=2Ec | 51 +++++++++++++++++-------------------
> 1 file changed, 24 insertions(+), 27 deletions(-)
>
>diff --git a/drivers/usb/host/xhci-ring=2Ec b/drivers/usb/host/xhci-ring=
=2Ec
>index d37eeee74960=2E=2Ea4383735b16c 100644
>--- a/drivers/usb/host/xhci-ring=2Ec
>+++ b/drivers/usb/host/xhci-ring=2Ec
>@@ -2761,35 +2761,25 @@ static int handle_tx_event(struct xhci_hcd *xhci,
> 		return 0;
> 	}
>=20
>-	do {
>-		/* This TRB should be in the TD at the head of this ring's
>-		 * TD list=2E
>+	if (list_empty(&ep_ring->td_list)) {
>+		/*
>+		 * Don't print wanings if ring is empty due to a stopped endpoint gene=
rating an

"wanings" should be "warnings", no?


>+		 * extra completion event if the device was suspended=2E Or, a event f=
or the last TRB
>+		 * of a short TD we already got a short event for=2E The short TD is a=
lready removed
>+		 * from the TD list=2E
> 		 */
>-		if (list_empty(&ep_ring->td_list)) {
>-			/*
>-			 * Don't print wanings if it's due to a stopped endpoint
>-			 * generating an extra completion event if the device
>-			 * was suspended=2E Or, a event for the last TRB of a
>-			 * short TD we already got a short event for=2E
>-			 * The short TD is already removed from the TD list=2E
>-			 */
>-
>-			if (!(trb_comp_code =3D=3D COMP_STOPPED ||
>-			      trb_comp_code =3D=3D COMP_STOPPED_LENGTH_INVALID ||
>-			      ep_ring->last_td_was_short)) {
>-				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued=
?\n",
>-					  slot_id, ep_index);
>-			}
>-			if (ep->skip) {
>-				ep->skip =3D false;
>-				xhci_dbg(xhci, "td_list is empty while skip flag set=2E Clear skip f=
lag for slot %u ep %u=2E\n",
>-					 slot_id, ep_index);
>-			}
>-
>-			td =3D NULL;
>-			goto check_endpoint_halted;
>+		if (trb_comp_code !=3D COMP_STOPPED &&
>+		    trb_comp_code !=3D COMP_STOPPED_LENGTH_INVALID &&
>+		    !ep_ring->last_td_was_short) {
>+			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
>+				  slot_id, ep_index);
> 		}
>=20
>+		ep->skip =3D false;
>+		goto check_endpoint_halted;
>+	}
>+
>+	do {
> 		td =3D list_first_entry(&ep_ring->td_list, struct xhci_td,
> 				      td_list);
>=20
>@@ -2800,7 +2790,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>=20
> 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
> 				skip_isoc_td(xhci, td, ep, status);
>-				continue;
>+				if (!list_empty(&ep_ring->td_list))
>+					continue;
>+
>+				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u=2E Clear skip flag=
=2E\n",
>+					 slot_id, ep_index);
>+				ep->skip =3D false;
>+				td =3D NULL;
>+				goto check_endpoint_halted;
> 			}
>=20
> 			/*

Kind regards,
FPS

