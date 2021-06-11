Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06AA3A3EF6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 11:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhFKJUf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 05:20:35 -0400
Received: from mail-eopbgr60056.outbound.protection.outlook.com ([40.107.6.56]:19104
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231469AbhFKJUe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 05:20:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHGWjzNqbMyONPIrxzUDZKk5goQkSp4Ly3Jaf8MU/0tR456DKtD0Ipz/liVtQ9/0IXpGNJStXHI3NvUXU2YwSW1+45GynaGn93tLJl/VrK3uZ+9QvTOK3kwhsUI7AlztoMeypi6zmOno9V2E+ta/fvb6goM0I78e6PYJbbTNtzrE0bHMKcOVlR8SE3pQGvzxAzWpLgOdk99NKFAQ1185VshtU3n6ZuVNaznC34dhMd1uN1VTQl/13slVnG8CUn4q8xh2p6hHhqid2q/i7Y9nOCIS+Hb1eLF66SvxLzkDRxCVmTSetgDWSB84VUXZdwbymS/+ma7DCWXzjLrGD/iF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Kr0l1Ljm7Qv1EGfNkFy2dKnLi1v5SXAW/pt+bahD/w=;
 b=UCGBBPWukjLpzwmzdpFMxx2LmPtccehYLtWSXgVA15u/+z7UlH0XSybPjGmPUUiSimzhLe4wFH1xtNTT9UwrIuTF3o5POgmaVOwwxYeUuz1YKZ14bptXMD9fZDHQDokBYgub27oIvbC6jh1bcVdeEDsBxY6EuX3RgwghAEFr9R47IFwWBAbWXBG02T0hV4S/tqL3TL7ZterrMXgx8DlMYMVvsx+uGm+NXIWAnOKjTvUWYCLybwZDGecqAYKAOTYa4CZoQZkCjvOQ01s7J24OxL2TWTcR/r6XrVxew9NxlCWvX3wGcOeLauyIhbhJE3u7PRzP9cAJKNX8t/gJRFnLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Kr0l1Ljm7Qv1EGfNkFy2dKnLi1v5SXAW/pt+bahD/w=;
 b=nvjeezA0DuMpoXYzVcoJSMCoOuCBO1POcuWVNFAC4u+Y7NAK5NegJT0WD0EYc7/XUzJrxjWdsQbD91zuTeD0suRWit1/p5DCKoKJVdpf/Tb/HR6+5Lt1SxjoeYnAMLAUc5YWqkYOn7G2q3AiArREGfRKe87UOuX+4gPKQJpshAk=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2368.eurprd04.prod.outlook.com (2603:10a6:800:29::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:18:33 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81%5]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 09:18:33 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Thread-Topic: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Thread-Index: AQHXQxCW2zwo/NGYwk29lWCvxWaIvKsOvmug
Date:   Fri, 11 Jun 2021 09:18:33 +0000
Message-ID: <VI1PR04MB5935A2455109376878C8440689349@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
 <1620370682-10199-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1620370682-10199-2-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7482c808-aefa-4255-95ae-08d92cb9e2e8
x-ms-traffictypediagnostic: VI1PR0401MB2368:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB23683F9FB222F6451B11DC7189349@VI1PR0401MB2368.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0K2D79sZij+UgEurq6GEyV6BzWlKRrwCUxYqiPaPZNUPiqMS0Qy+6OIxyQmCkb+TY4IJn/Xn6O4nj5RPtJmOD4SIQVNTdW9Q/g8YzWY8sy2sa/ObKvI0o8XAzHxtaApOp3LgRkh7hexs8inEj0cdjnrVlWxuY5DhQucya0T3V1+vtuvjEPZ1XJgZsVTCLrm1zlF9o4Q/26deioR73CfyUn8OtxdqCH8+UKn/+ZEsUZSlaBTn5UQ01MaOtD7Xle4R1UHBq7yhCeHI3Jf1/d5mn8FhMTLpZFXL9frVWtOdrQfOEYyblxS1ayIOUY17NcCLQ9VmIroQVfd4ZALFQO2nulr/C6NNipB8AabOcPJnG7PsYImBXSB7ZcNOs1NvjkpowUpVmLS/qfodA8peRKRJvCixXjo9/2frGoYA7UER1YiZGQ68T+4b9JBX2JbImlybK3iLudPc3DPq3ggiU/I+p4ec0IDT0Ee1SlYQzQT7v1VkPNcwbGPj2LxfMROLUPbk+m5Dsa4OUpo3hsTNJiKAbWF2/rjS1DPtlV+ixXCH0+NfmVs57KN8nvR2WI5Gxj7cIFm9gnNHOXtf+kq9q/xg56/HuTh/d7IXm0EYwXl2LMo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(478600001)(8676002)(122000001)(33656002)(6916009)(8936002)(38100700002)(76116006)(66446008)(64756008)(66476007)(66946007)(66556008)(86362001)(53546011)(6506007)(26005)(52536014)(186003)(44832011)(9686003)(55016002)(71200400001)(83380400001)(316002)(5660300002)(7696005)(54906003)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j1I7zAC25TyrDRAnLPzm1AMkQOgyKCz7llLFKrDOmZkttvSFBzvoOT1HDbcU?=
 =?us-ascii?Q?ZY1wl9/3QmmgKNL3CJyGZ7A3AgE4ss1zG5p2mLwJaVVlTS2ihC87xj3EJM1E?=
 =?us-ascii?Q?uDWOjfLydFTihoZSgCvTgKEzl/OvUPGi7Hjkgm8AIgQpsJomTEochORxf0Q4?=
 =?us-ascii?Q?igvNcF7/JFrgHJwoucHGo5y0dnmQvqR6dlAFNoD4dMaeGTHSXow45twAyBUs?=
 =?us-ascii?Q?aPJU0sTd0UFNmSS3HtNL4To4Z5dL13Ks5GbRk5yAaIOs7ZHAyRUb0+w6clwU?=
 =?us-ascii?Q?+Q/TkFg9Hd9uxyjWXrrC6BEFVk/DndlwahDRW5oP0s843n+E1GdTgsjoEPVb?=
 =?us-ascii?Q?GWbOr1roQcSSwIDhGvZ6S39S8JeDDAQxHKWxk5ZIHnaoOLS2w97A2DFBClu/?=
 =?us-ascii?Q?SOAMAsj27TvYw3XEzMORQ3fAqOwifrmMcrtR5/cFWchJxdHXhUqbQkvyuE3u?=
 =?us-ascii?Q?zJwJ0aJZuSh4pox9m9H/ZU3zC9rsLWwbzuyqF2bfInEfYip/DCvTNVrZ1pT4?=
 =?us-ascii?Q?loOnzVrz8jmGXJHyMDgb5r+4ItJBgwviN+DRoRddndWZSS/PMRHCiXjR4KkF?=
 =?us-ascii?Q?zRcJFZyoWp7aHn3FclMUNuGR7wlh4ibWEpWiq/wmxsMJsJup7VX2tFoUiph6?=
 =?us-ascii?Q?18ZLkwIzWnzq1c9r/Qp1qIBL/to5ddmg8auekhskuHPvIC3d1ZSJbcNfnK6M?=
 =?us-ascii?Q?w5XP8LSWsQRtYSYtOcBwSCHfuEysNTW1FYJwBU32QUNMe809aOxQUovlWYDd?=
 =?us-ascii?Q?f0uI0+M+epr0syufCC7GdMReXUrMrptBh4M8yluAM35vvL+jaVjmOtxbGTaA?=
 =?us-ascii?Q?iNZE6xkUX3FylM1rzyfGmtNUI5nCsBSY+eVqzFhPPl6jPpnYVn4/1CaQdymJ?=
 =?us-ascii?Q?wfVp3crgCTcac6BLEhCLJucqYeNFm6JfkNjOx2tM36iAlMMP8OBO4VQGd9sI?=
 =?us-ascii?Q?FCCtK2vybr7O8raUFr+g/ygp/iEqrn64lFVv1ANO3j4tjmBCDplNNxLvEUt1?=
 =?us-ascii?Q?xFvSjlkva3By3ATm0eehARCFFmaVWAiIugh5c13ozEqpYYl7EUB5KQWDvfaS?=
 =?us-ascii?Q?50rgCDJCfZNUA6Eihjuf2B5cTlXqFjvUBTF5mVw6uabgA4FxRxhUiq5Xom5r?=
 =?us-ascii?Q?qeetLyl7heVXHBPIFWFWMdt1+LhNdoCb9Y6gLqCHCGogG3ZdqBuxXF4KABle?=
 =?us-ascii?Q?kFBO5msMkPkmPlzn3CtxFHDcae+ZuEK1aIN1VJx72EXX8TwQa1z06+Gj+gTz?=
 =?us-ascii?Q?xKu9Yfa3xuH/uR3isJ7H70MkfNgYTnjpsH/MXqMuALEfoZ4kEZ935L0FiCMn?=
 =?us-ascii?Q?psnBDIgnyqiQJnWD8yI9L4gZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7482c808-aefa-4255-95ae-08d92cb9e2e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 09:18:33.5382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6hD4WAV+Z3mZm1jHEsrSzSvb03ZSYFviOaAwhKfbB/Q7NGqYoXoWDoQBt6zOqqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2368
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Friday, May 7, 2021 2:58 PM
> To: gregkh@linuxfoundation.org; stern@rowland.harvard.edu;
> mathias.nyman@intel.com
> Cc: peter.chen@kernel.org; Jun Li <jun.li@nxp.com>; jackp@codeaurora.org;
> linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE T=
est
> for USB2
>=20
> From: Peter Chen <peter.chen@nxp.com>
>=20
> This function is similar with EHCI's, but implemented using XHCI.
> The USB2 host needs to send SETUP packet first, then wait 15 seconds befo=
re
> DATA (IN) + STATUS stage.
>=20
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
> Change for v3:
> - No change.
>=20
> Change for v2:
> - No change.
>=20
>  drivers/usb/host/xhci-hub.c  |  10 +++
>  drivers/usb/host/xhci-ring.c | 123 +++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.c      |   1 +
>  drivers/usb/host/xhci.h      |  10 +++
>  4 files changed, 144 insertions(+)
>=20
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index e9b18fc17617..c64ee95cc89b 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1511,6 +1511,16 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 type=
Req,
> u16 wValue,
>  			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
>  			if (hcd->speed !=3D HCD_USB2)
>  				goto error;
> +
> +#ifdef CONFIG_USB_HCD_TEST_MODE
> +			if (test_mode =3D=3D EHSET_TEST_SINGLE_STEP_SET_FEATURE) {
> +				spin_unlock_irqrestore(&xhci->lock, flags);
> +				retval =3D ehset_single_step_set_feature(hcd,
> +								wIndex + 1);
> +				spin_lock_irqsave(&xhci->lock, flags);
> +				break;
> +			}
> +#endif
>  			if (test_mode > USB_TEST_FORCE_ENABLE ||
>  			    test_mode < USB_TEST_J)
>  				goto error;
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 05c38dd3ee36..87a9c1e3325a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3793,6 +3793,129 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp=
_t
> mem_flags,
>  	return 0;
>  }
>=20
> +#ifdef CONFIG_USB_HCD_TEST_MODE
> +/*
> + * This function prepare TRBs and submits them for the
> + * SINGLE_STEP_SET_FEATURE Test.
> + * This is done in two parts: first SETUP req for GetDesc is sent then
> + * 15 seconds later, the IN stage for GetDesc starts to req data from
> +dev
> + *
> + * is_setup : argument decides which of the two stage needs to be
> + * performed; TRUE - SETUP and FALSE - IN+STATUS
> + * Returns 0 if success
> + */
> +int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
> +	struct urb *urb, int is_setup)
> +{
> +	int slot_id;
> +	unsigned int ep_index;
> +	struct xhci_ring *ep_ring;
> +	int ret;
> +	struct usb_ctrlrequest *setup;
> +	struct xhci_generic_trb *start_trb;
> +	int start_cycle;
> +	u32 field, length_field, remainder;
> +	struct urb_priv *urb_priv;
> +	struct xhci_td *td;
> +	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
> +
> +	/* urb_priv will be free after transcation has completed */
> +	urb_priv =3D kzalloc(sizeof(struct urb_priv) +
> +			sizeof(struct xhci_td), GFP_KERNEL);
> +	if (!urb_priv)
> +		return -ENOMEM;
> +
> +	td =3D &urb_priv->td[0];
> +	urb_priv->num_tds =3D 1;
> +	urb_priv->num_tds_done =3D 0;
> +	urb->hcpriv =3D urb_priv;
> +
> +	ep_ring =3D xhci_urb_to_transfer_ring(xhci, urb);
> +	if (!ep_ring) {
> +		ret =3D -EINVAL;
> +		goto free_priv;
> +	}
> +
> +	slot_id =3D urb->dev->slot_id;
> +	ep_index =3D xhci_get_endpoint_index(&urb->ep->desc);
> +
> +	setup =3D (struct usb_ctrlrequest *) urb->setup_packet;
> +	if (is_setup) {
> +		ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
> +				ep_index, urb->stream_id,
> +				1, urb, 0, GFP_KERNEL);
> +		if (ret < 0)
> +			goto free_priv;
> +
> +		start_trb =3D &ep_ring->enqueue->generic;
> +		start_cycle =3D ep_ring->cycle_state;
> +		/* Save the DMA address of the last TRB in the TD */
> +		td->last_trb =3D ep_ring->enqueue;
> +		field =3D TRB_IOC | TRB_IDT | TRB_TYPE(TRB_SETUP) | start_cycle;
> +		/* xHCI 1.0/1.1 6.4.1.2.1: Transfer Type field */
> +		if ((xhci->hci_version >=3D 0x100) ||
> +				(xhci->quirks & XHCI_MTK_HOST))
> +			field |=3D TRB_TX_TYPE(TRB_DATA_IN);
> +
> +		queue_trb(xhci, ep_ring, false,
> +			  setup->bRequestType | setup->bRequest << 8 |
> +			  le16_to_cpu(setup->wValue) << 16,
> +			  le16_to_cpu(setup->wIndex) |
> +			  le16_to_cpu(setup->wLength) << 16,
> +			  TRB_LEN(8) | TRB_INTR_TARGET(0),
> +			  /* Immediate data in pointer */
> +			  field);
> +		giveback_first_trb(xhci, slot_id, ep_index, urb->stream_id,
> +				start_cycle, start_trb);
> +		return 0;
> +	}
> +
> +	ret =3D prepare_transfer(xhci, xhci->devs[slot_id],
> +			ep_index, urb->stream_id,
> +			2, urb, 0, GFP_KERNEL);
> +	if (ret < 0)
> +		goto free_priv;
> +
> +	start_trb =3D &ep_ring->enqueue->generic;
> +	start_cycle =3D ep_ring->cycle_state;
> +	field =3D TRB_ISP | TRB_TYPE(TRB_DATA);
> +
> +	remainder =3D xhci_td_remainder(xhci, 0,
> +				   urb->transfer_buffer_length,
> +				   urb->transfer_buffer_length,
> +				   urb, 1);
> +
> +	length_field =3D TRB_LEN(urb->transfer_buffer_length) |
> +		TRB_TD_SIZE(remainder) |
> +		TRB_INTR_TARGET(0);
> +
> +	if (urb->transfer_buffer_length > 0) {
> +		field |=3D TRB_DIR_IN;
> +		queue_trb(xhci, ep_ring, true,
> +				lower_32_bits(urb->transfer_dma),
> +				upper_32_bits(urb->transfer_dma),
> +				length_field,
> +				field | ep_ring->cycle_state);
> +	}
> +
> +	td->last_trb =3D ep_ring->enqueue;
> +	field =3D TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state;
> +	queue_trb(xhci, ep_ring, false,
> +			0,
> +			0,
> +			TRB_INTR_TARGET(0),
> +			field);
> +
> +	giveback_first_trb(xhci, slot_id, ep_index, 0,
> +			start_cycle, start_trb);
> +
> +	return 0;
> +free_priv:
> +	xhci_urb_free_priv(urb_priv);
> +	return ret;
> +}
> +#endif /* CONFIG_USB_HCD_TEST_MODE */
> +
>  /*
>   * The transfer burst count field of the isochronous TRB defines the num=
ber
> of
>   * bursts that are required to move all packets in this TD.  Only SuperS=
peed
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c index
> ca9385d22f68..a27616775845 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -5426,6 +5426,7 @@ static const struct hc_driver xhci_hc_driver =3D {
>  	.disable_usb3_lpm_timeout =3D	xhci_disable_usb3_lpm_timeout,
>  	.find_raw_port_number =3D	xhci_find_raw_port_number,
>  	.clear_tt_buffer_complete =3D xhci_clear_tt_buffer_complete,
> +	.submit_single_step_set_feature	=3D
> xhci_submit_single_step_set_feature,
>  };
>=20
>  void xhci_init_driver(struct hc_driver *drv, diff --git
> a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h index
> 2595a8f057c4..f93fc8f59af6 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2165,6 +2165,16 @@ int xhci_find_raw_port_number(struct usb_hcd *hcd,
> int port1);  struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
>=20
>  void xhci_hc_died(struct xhci_hcd *xhci);
> +#ifdef CONFIG_USB_HCD_TEST_MODE
> +int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
> +	struct urb *urb, int is_setup);
> +#else
> +static inline int xhci_submit_single_step_set_feature(struct usb_hcd
> *hcd,
> +	struct urb *urb, int is_setup)
> +{
> +	return 0;
> +}
> +#endif
>=20
>  #ifdef CONFIG_PM
>  int xhci_bus_suspend(struct usb_hcd *hcd);
> --
> 2.25.1

A gentle ping.

Li Jun

