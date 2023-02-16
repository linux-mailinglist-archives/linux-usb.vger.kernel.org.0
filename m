Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B320F698AAD
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 03:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjBPCzM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 21:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBPCzL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 21:55:11 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48FE46097
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 18:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeOG6F16BoH3BpIy302/mjh7c8uPMJruVC25Ro+Zf76aMYzbeIA1GHKg0Jrtex2X0O6SAQL/KD+Elxk6LXphc2NRtmS2urbPMjxuLPpmC98HMARwTf4QEZ+KTZR3DUnM8g/Dk8kZvN2ASH9g8iGyLFc16lLY3kG1bpyncPXzPvgY7WT69H6CUDRtkXqhlm2fg9n4uCCsGij7IbUjtdbVVp8T8qj6oOkyqzdravTX4GAI0oDvXauaOdUiMmTaWyUqG8BcSayzWVefuRnMtVuzK73IC5BsuPX16wDa4Bumbd18+b1suEkInAW+yrcJaqR9UdTLcEblzZqLVkWdNs7gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/Cf2hWVBbbdFwIXXg5Whq3jYxu8dZSr1lv+YYrpJwM=;
 b=IC0fDL/YLwdqxZjsQPpGj/uIo1mOf+ElcsYkA31Ou1eHhzJLSnj/0JolSz2l5KUk04OVmkcoHKNLEpDL4lAqAFmQfHmil44PpzCKHaEGNw8NSlQQfJCihSqJPAwz+Ru+wV2t7cixpBQMlksB5E7okHpZIxTr1DrwQUTzmmoyxM5dKDVArXuLf2UAKlJsVtnnDY87575meo8hlid9eWQsVW77CcRvQ9CE3ruUXIaPwbrX5N5uiITEHw5urvSyw2ogNlpzywJMgn8jrIBshuK42LKu826XhRrWYkvsc/PereBhMrk67IW7a+UcXPCEM8BByjHPUSY5rocHlcZiZanyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/Cf2hWVBbbdFwIXXg5Whq3jYxu8dZSr1lv+YYrpJwM=;
 b=F8mHr/P+H5S3rsmPbIPwoi2OINesTLAcRdrB6ql+I4BAQjCNwbacWQctH+/pCte3YYZne0S2c8X6E1IVtAANvNW+ym8sq2T+UPT+LiHuOD2fCrLlCdfFRfu/pU4Vv106ww/CSxwKR5Ij8+4GeV7Y+k687XCD3/epGpKeuGB1sSM=
Received: from VI1PR04MB4511.eurprd04.prod.outlook.com (2603:10a6:803:74::17)
 by PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 02:55:07 +0000
Received: from VI1PR04MB4511.eurprd04.prod.outlook.com
 ([fe80::6a03:87a3:996b:e894]) by VI1PR04MB4511.eurprd04.prod.outlook.com
 ([fe80::6a03:87a3:996b:e894%5]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 02:55:07 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: fix warning when handle
 discover_identity message
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: fix warning when handle
 discover_identity message
Thread-Index: AQHZQTDYamIyEQml6kSJLWOle0fOAa7QBC8AgADdQsA=
Date:   Thu, 16 Feb 2023 02:55:07 +0000
Message-ID: <VI1PR04MB451122A9B0581ECFD06E02CD8CA09@VI1PR04MB4511.eurprd04.prod.outlook.com>
References: <20230215113136.2838773-1-xu.yang_2@nxp.com>
 <Y+zhKhCMeJ654XtE@kuha.fi.intel.com>
In-Reply-To: <Y+zhKhCMeJ654XtE@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB4511:EE_|PA4PR04MB7821:EE_
x-ms-office365-filtering-correlation-id: 29f9d01d-8e1e-4c9c-6272-08db0fc93609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0MmLTJrrBHoNDR8GdX67nkebHObOItXS+C5x2AMKbNTV6TLKGItnVhCtYbAVO029wmg13xPaG4SpH0QS64IlBj0/RxbOT1CqHP8RqdFJGniuZlopdrQ2YR8u9FwTGNM8VkK87mlqPiaCSxmVVAFkFPD2MWAzx1TWikEqTDiv07tV/LliKvc5oJMiRaZoo/H7hKDc82pIzG2Gl2Zl6CT/WyisaydkbYJsEV2+1twJYE0fGmwIpltVms68k24n/j5Ff+cSx+5NlJfRtgmGhx53SVv2HHIfjvcmuH7VTOspHzyovWy1zArXQpWK9CU7y6kKxnCjV8yYxwM+8fhH0GNYUYd0kL2rdKg64H1gE9trkUgrPd5TAkLfMw8TPUFEwP16F354V+Vs4ARRAbDAqBN+GVRhGqBMk2QdxHEFT0faI5AZmRwRQcHdEVgY8TgAZ037e3JQiURT3IgN0fiHwC76UpslYX7QBtchXUYshCt9GbI5vDRMmUSv8EjuLoQNnrAJhVKxx8pCnldFJKUDTqCrcrpjPHJjJJnApxuT9cG3xzufJChyk9zSpK5FCiAxwJABGVilFqY6N1wiq2sEW9mlPx+v/cDQvJHtG1DrXjCk38iOs4WK0SgO26E7LwCrSn7IKTuCV2KwrwHvikMKbWgHK6SQGRGQEDiz34OUyQm2diXe8xUaZzhBqr8vkPSfm3NThT60c6EeoWk0mSRv0wzn9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4511.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199018)(41300700001)(52536014)(5660300002)(33656002)(8936002)(83380400001)(86362001)(76116006)(478600001)(38100700002)(38070700005)(55016003)(4326008)(71200400001)(122000001)(7696005)(66446008)(66946007)(8676002)(64756008)(6916009)(54906003)(66556008)(66476007)(316002)(6506007)(9686003)(26005)(186003)(53546011)(2906002)(15650500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QFr4FtFFvBQZ6qkW0PjADeD7baKKp9WVjrVptwA6Z9OlM2rlCFhpEepBIqDc?=
 =?us-ascii?Q?tsPnojQeTFutimmLSf2ebqxIDtWhHMr6W9qtvYRMv5nqNXJ/lDBU9T53XgrX?=
 =?us-ascii?Q?yT4Fase4sLK3SQMAu5lHdbaDJAmD7D2jiWHAre/53nBNKIbO/lt/uIQqA0Rk?=
 =?us-ascii?Q?urKPioFGDzQCPjikyaPmxGQ0wNTC2cV4O3siKwoMljed0g9MGo+kfqjcopo/?=
 =?us-ascii?Q?VmEbznhuyCZc3nJ9MZOkkLyhrknOAzhil1C/OfdQN15UvOcnXNtqNKO1Vygm?=
 =?us-ascii?Q?zFiiob/ahcS3LJC0efm/DfW7v+BpydboNbmXrD+UiqVFDLZt0KkqMHWqgC5z?=
 =?us-ascii?Q?C4QDcn/Wj4jJfTTMD9qak++5YCsCvxsCu+pg3dEGnxAtK2Wp/UEWx3w/iDHr?=
 =?us-ascii?Q?xGnuLz6i7QiT6XYDW0DFv10CxGx1jwF3NX9aQVjjch5U2u3rv9HbcV4v07LE?=
 =?us-ascii?Q?jmunSs5jF8w/f/8nwpkM5vtH37t3RExFCdz15wSWu55WNgMcJkSX0ipLblyO?=
 =?us-ascii?Q?XDI5V3dNb6Y7NgleSMXdbRlJYzNUxkvz7UULiAdveLMuYRYJlQMmbpIuiydE?=
 =?us-ascii?Q?SRkJdZDWfWHCSU0Nzgu4XdwG9xSUN0lgI/2ZS1k3GBaYuMqFP1A9SGAfe611?=
 =?us-ascii?Q?TFjAiS5a0q6ZrMBGsA471Wo1yYielBRaCh0iT93fuAsY3u7Vml3jyeokNYeP?=
 =?us-ascii?Q?wX90zP4y6rj5vhddpQ5yWJU6Z2D20nqW2Pe5duOeCHisCwsvvLfqz2DDgvlf?=
 =?us-ascii?Q?sBfPkVZLe6XZE0CitlDL/p8P6Cs4c1DW9HgWbLJ1XdOBIImGQ8kokEFwynH/?=
 =?us-ascii?Q?Kf5dDBilkyfwChJyYH1sjNyvSh/67FPGezCjz/ODtJ6bqo5hPPHFcFTJ17oz?=
 =?us-ascii?Q?r5h/y2sw88ycL7OHw1PVhlROPFk3juqc/3ZV/GLlef5jCrwa9rcIGga8OAFE?=
 =?us-ascii?Q?h91ZTUugRC24xt+ZnZ+y5dCy7lshMTsrHzPTieoxvdCSXArC+YPcRnaaAG6e?=
 =?us-ascii?Q?HQDtdqQc06FA1LgKwLXPFyw7O8cQ343o9V9CHWYN0GL7PbCy26Q+8In+5RkB?=
 =?us-ascii?Q?SV0HGZW8/GwZ9m47n+6Px14SHRvCwWF1YuEOIZTBXR1+j02cq9qfTqwHBnNz?=
 =?us-ascii?Q?VoHvMkSKsvrRJhuPiU1WWBva4AI2tYAKgmro+V4hep0FO7lG0dk3vWamwrwF?=
 =?us-ascii?Q?1wfbYAUIabi6TM9Uz7am/5JiQ/W5Gz+9tYY1Um/IfKBso/N8vKrjrVRDP1Ns?=
 =?us-ascii?Q?FuTJ1uJwYR8ox9ygkZR6oGjQZovg6pB4ACuumGkdbYXu5UT6LKZ+Ab3mK8VJ?=
 =?us-ascii?Q?qD09gUzg0MU9+rgBB4I2s4StDZWvTfluJbX6r9CTTnnbcfMrheLxLGvFqiF2?=
 =?us-ascii?Q?YF7Yd3d+Y2PNvpYhVOidgLK4PlaKYoTa4Ad/BKliqAIOqXh7C7iT+W+6gC03?=
 =?us-ascii?Q?ZhF4Z2HVUVlGTYxT+eyM6rEEh434M+q4u9UJS9RA+YTDh/OnKYXo5JJ8701Q?=
 =?us-ascii?Q?gS3+bBs4h4tua1Ctz1bd9R2UW8rv8D/IAsxJsW0eKMK64vQfILeiJLSuLfvr?=
 =?us-ascii?Q?uGn7q2XPnG2TVV5y/MI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4511.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f9d01d-8e1e-4c9c-6272-08db0fc93609
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 02:55:07.2172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpFF3c1laGWwkRDeebYpTlG+b+zwo7LfidbhC+FRJohkPSHWsyc6oUpNCTraPWpCODA2GMBDuxu0eLrpUp1JsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7821
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, February 15, 2023 9:42 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: linux@roeck-us.net; gregkh@linuxfoundation.org; linux-usb@vger.kernel=
.org; dl-linux-imx <linux-imx@nxp.com>; Jun
> Li <jun.li@nxp.com>
> Subject: [EXT] Re: [PATCH] usb: typec: tcpm: fix warning when handle disc=
over_identity message
>=20
> Caution: EXT Email
>=20
> Hi,
>=20
> On Wed, Feb 15, 2023 at 07:31:36PM +0800, Xu Yang wrote:
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 7f39cb9b3429..914bbaf4e25e 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -1445,10 +1445,19 @@ static int tcpm_ams_start(struct tcpm_port *por=
t, enum tcpm_ams ams)
> >  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
> >                          const u32 *data, int cnt)
> >  {
> > +     u32 vdo_hdr =3D port->vdo_data[0];
> > +
> >       WARN_ON(!mutex_is_locked(&port->lock));
> >
> > -     /* Make sure we are not still processing a previous VDM packet */
> > -     WARN_ON(port->vdm_state > VDM_STATE_DONE);
> > +     /* If is sending discover_identity, handle received message first=
ly */
> > +     if (PD_VDO_SVDM(vdo_hdr) &&
> > +             PD_VDO_CMD(vdo_hdr) =3D=3D CMD_DISCOVER_IDENT) {
>=20
> One line is enough.

Okay.

>=20
> > +             port->send_discover =3D true;
> > +             mod_send_discover_delayed_work(port,
> > +                                     SEND_DISCOVER_RETRY_MS);
>=20
> Ditto.

Okay.

>=20
> > +     } else
> > +             /* Make sure we are not still processing a previous VDM p=
acket */
> > +             WARN_ON(port->vdm_state > VDM_STATE_DONE);
>=20
> You need braces around the else statement in this case.

Okay.

>=20
> >
> >       port->vdo_count =3D cnt + 1;
> >       port->vdo_data[0] =3D header;
> > @@ -1950,9 +1959,11 @@ static void vdm_run_state_machine(struct tcpm_po=
rt *port)
> >                               res =3D tcpm_ams_start(port, DISCOVER_IDE=
NTITY);
> >                               if (res =3D=3D 0)
> >                                       port->send_discover =3D false;
> > -                             else if (res =3D=3D -EAGAIN)
> > +                             else if (res =3D=3D -EAGAIN) {
> > +                                     port->vdo_data[0] =3D 0;
> >                                       mod_send_discover_delayed_work(po=
rt,
> >                                                                      SE=
ND_DISCOVER_RETRY_MS);
> > +                             }
> >                               break;
> >                       case CMD_DISCOVER_SVID:
> >                               res =3D tcpm_ams_start(port, DISCOVER_SVI=
DS);
> > @@ -2035,6 +2046,7 @@ static void vdm_run_state_machine(struct tcpm_por=
t *port)
> >                       unsigned long timeout;
> >
> >                       port->vdm_retries =3D 0;
> > +                     port->vdo_data[0] =3D 0;
> >                       port->vdm_state =3D VDM_STATE_BUSY;
> >                       timeout =3D vdm_ready_timeout(vdo_hdr);
> >                       mod_vdm_delayed_work(port, timeout);
>=20

Thanks,
Xu Yang

> thanks,
>=20
> --
> heikki
