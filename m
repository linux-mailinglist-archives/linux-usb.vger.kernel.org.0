Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAD2614380
	for <lists+linux-usb@lfdr.de>; Tue,  1 Nov 2022 04:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiKADKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 23:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiKADKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 23:10:50 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2059.outbound.protection.outlook.com [40.107.249.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BA513F9C
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 20:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO/964gUklcErJdgTljuEBzyNii9rCK8Y7m9M/PYQVl5hOBYMvpnh9PyCwOhvizpZ56t+g4Gn8cvKL1c3Za3TzyUNigANCvcdksMN1KXGgPVdwKGVWV4RCuNaSgU6N/9HUtoNfU0vLZl7NkSA0Uv08kySPzVPd0gnOJv3RdykFCoxG5lDK2yaYzvuwylOww9btZ0PE8m732HggOMe0CwSRLxtF5pvFvzpeVpz7Cfak8jC5u/vL9Kd96rOszljFLe/qs3a6C5SH3D8dVlaB9I45QAdUIdM8Tr/OOfwMpypEQ4gQLE+bZ+nBhDcTOaTOdYVvD8h+ndDwpVou5ebdSHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd9d1pGzoRYCtUs80SP9EiMpbfXFJ0FUA+8F4V7mGCE=;
 b=RerO5plgAwDS6I+OinrdXBXdn3rJGYRsXaxn865Yyp3c37jLinpaXT8pUSoYbGe0/zlpo/zmBHTMi9OWA+V1X/kfSrXcWFhhIr8b5oRg03l7lj90VSJlcXx+IxIYPmM4KUOoKkZmdQlzabT3RV38ZeeI3g5oRA2MsKPbJvJ27M+Cdi5VfRDCeWDpuipRlpqs88eD9lDgqhNg4CGWpfd1HBflq3a902oc1iJjdSAIYVUgUmhaEor1A3tet8fkfsGi96JHI/AbBVRaYU5DL1lnj3dxxevMUoA8Ddd/1IGYK6qy85T/9k/AOquVDUWCeqEO/ZyD61Z5vj56wPyOlMciOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd9d1pGzoRYCtUs80SP9EiMpbfXFJ0FUA+8F4V7mGCE=;
 b=QBsJgqWKyFq9SreA8Rh4FBuJZEf7X9R8XYYhCyBWC0MB98Rnqp23IjbmBAggYxpmdnP22Mg8yNm0DbzjjB4AuDeaMO5K9Q8oMoUO8EVxr5LP5nvz5jED/Vct0YIGeB5er/T/ru2rZ7tiHQWJTSUL14W9Vvy5pAhVzbdFpLSxhxw=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DBAPR04MB7221.eurprd04.prod.outlook.com (2603:10a6:10:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Tue, 1 Nov
 2022 03:10:46 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%9]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 03:10:46 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Francesco Dolcini <francesco@dolcini.it>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>
CC:     Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        "philippe.schenker@toradex.com" <philippe.schenker@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: RE: USB runtime PM issues on i.MX6ULL
Thread-Topic: USB runtime PM issues on i.MX6ULL
Thread-Index: AQHY6slI0uttgXhTUkWibWMoTeyBrq4ohyNwgAADqQCAANZ5gA==
Date:   Tue, 1 Nov 2022 03:10:46 +0000
Message-ID: <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
In-Reply-To: <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|DBAPR04MB7221:EE_
x-ms-office365-filtering-correlation-id: 5f0503f7-fcb9-45af-83fc-08dabbb6abdc
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TaaL8NsUiOnLxLPmrnHmorNS3c5NeVbFjmqZzCPaXYOlbTr2ZnxlRMTqIQD4jMUM+Ku8SqNyGi1HRUlLvX4ozN3ZuNpgUhAzuKk+rV1ddnyC+rNQ1W5fGR5X9fwMptizOtC5Vwbec5vzl7gYN0F76VfGa/MfYj1I0f1wDPAmfi1tHvumPtKWDMyZzmfxSkjcy6wnPPwtVpzPVqkIIBv426sUuv+x4FzOR3PebDcUM4Dxbt+GbkFRjh7ma8ifFcfbqfhMqwqKDkUkiXqdC+1Wqjacf1Yzyo6yWxZVtbqi+lQ+gIKR77qgwfAPoUar8Ov1IWZpfL1/usmSEJ0Z3QbaA6V5aUsHNOe37vTf8tWmRfKxCWUc11rXYTYjUYjvovsGs+9xfI6SQsudCBcl4Shmh5k++qPnRmHOGF6NT3QksGf18habbOMAOlIr88E/82qoeN+8Gzb04/NbU2NfrRvLkvPKWu221hIRwguuPg1CqFmsXWLe3NNSv67dA+FXXtWj0QtrTYZsq/5YOvKHMnTj7Kfxl/QKGZpd143fAvNeaWSmPXiz0Y5zZoIBgCUNrqMWq94DehDWTbqynEWFKMlg4zp3SN5ndSZjIhAMB2TfMsHr6EtUKxKE+80YH7Ip3MQLWrF0spSMFk2Drl4JQASeWkqDx59HcwdDDnOWMq+jPdNUyZjDsCVmzTnUKxqXfCYu0VSnVeu6fCIkTlL7psGzyQq+4KfGvYQVyWRZaZuIGUYx1hc+VBaUrBhkLzJDAF9NyZKvNw6hPu8s9c6h5sTydg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(2906002)(86362001)(44832011)(33656002)(83380400001)(71200400001)(55016003)(38070700005)(66446008)(5660300002)(41300700001)(66476007)(52536014)(7416002)(64756008)(8936002)(8676002)(4326008)(66556008)(76116006)(54906003)(110136005)(186003)(478600001)(9686003)(6506007)(7696005)(53546011)(66946007)(316002)(38100700002)(26005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8VQ3qdHMDZIBBMwwYlMzbKVoA3L5fe+F6RU56y4W1KFCMy5hjevfDv9F+dl5?=
 =?us-ascii?Q?MLFa2us828NuaHB0XO5Bl9VNG8bEilOMatouWf12cyW9iHzie0t8hCLlN0zs?=
 =?us-ascii?Q?XBOTH1DO1YigwRo6bIT0eJ+ACprzn0Wjli0mpb+Efc/ZQ3QjWDApklkk2Nw8?=
 =?us-ascii?Q?bJQFbUArZKM00Ak7ZxvDcLVNGIHTvHYGIM/nBdmhrl8/eWs0wqxpoP222UwP?=
 =?us-ascii?Q?/A3r8xKEhEuvMLVLdQPKs9lYS7yMfiHfc+cqyNlqHtHf017pVvjtQE1C0BPC?=
 =?us-ascii?Q?zsI/7JlI259aIjdVKFKKR2V5nixvQ6NTfN37ZZXfsRF255PgPGjdbQ8rxj89?=
 =?us-ascii?Q?4AaqNVLRPQFJeOuBEw13gnwXktFVkeCGiNREpiXJFjz6bHufMaBVVDmEQ4u5?=
 =?us-ascii?Q?n51UxxUqMkNjOVbHxZ3KJTuzXg6yvp47ptQFE0DbB7apWLV1gEsyQiJZ8waR?=
 =?us-ascii?Q?Xh1oBbyj/DOtAjDiN2S9nN2NahoQFrvg/348cp2idY+APcECH3qx7LrDfj3x?=
 =?us-ascii?Q?Uwu2+F6xYAIGYLdcqJYooIa2NIykwiPiY5l6i3RdnPfCixWLuDlcZPR8S7X8?=
 =?us-ascii?Q?OwuG0S1w9307WBoOWGdZuhIw8o5KXjTNGDXGw8vbefFxInXFRpaZjWti9nfB?=
 =?us-ascii?Q?hNEQGkS5vfgzwBb3z1S56WTpz7G1PsYTbhEEf02jX2WGkCMkD+Ff0CN90H0g?=
 =?us-ascii?Q?Pz+rB4X2Cp/MTnVXFkIuitVUuFNt3DjVW1Oos2lYiM5xDFPp166w12+jbG40?=
 =?us-ascii?Q?TT9XQdzAUe5OXbzZNxMsbZcWx8on2PuB0nxTeV4RlwXHipvNDR7yhyPQp2CX?=
 =?us-ascii?Q?VZJOU8G8lEVVMhoNwA7648E3wCDO0OMKvbR9k/ZHpvsUHQ43ojdge/ImUfU5?=
 =?us-ascii?Q?75pfZ3edX3kv/HvOrDeqAeNWEAP7CmuGCXttsdQdsYjfpGmurzGW5FTcmJON?=
 =?us-ascii?Q?n2wyTvGAcSzK5B5KymrCGMS9U0YW6gLIRUIm0swUthiVy15aDA/p+v6cGlWF?=
 =?us-ascii?Q?Uo5kybnSxuLzjZCbAJe3A94YkDP/8O07PWuS7CGky/pZ2YK9spoUp/RzKW1G?=
 =?us-ascii?Q?ejpsgiORLRJtGgOM5Uxk2AtWP2LSD+FJeM0tqtpZwWAtBnAmSxGLntKljWso?=
 =?us-ascii?Q?yczopDAOe5Gx9BYlOUFWQ7zxnZk55Ny0srvkB/tmMyPA1QS6W+HpZvt4hXYx?=
 =?us-ascii?Q?m/NixHwt+RHH5KAssPODAdu7QjOlDtSVz39ACqKkBnb+C6qqJwCEo7qXWctr?=
 =?us-ascii?Q?P7A2hlilBCe/4AOhliT76p2VkhiJDLNKgdDPqiFg7QusUWYc9xBv9JByxNMK?=
 =?us-ascii?Q?b3W7AThlHMXyOARXSAKdky0tZ8ahYFOAFsjxLdLGmP5kJke8chK5yGsmpffw?=
 =?us-ascii?Q?jI2gMzjaOpvvZFCIvyJdLLBbBdEt47q6s24er+oiYMxZT1OSnBcvSH8VMnc2?=
 =?us-ascii?Q?WvhUZDccszP13KfY70JHHVmcJq7bqSOIquLEcay8FIy/e0u7/4P7nvF+enQd?=
 =?us-ascii?Q?haXx1dIZ0xwl7B6JsRI3WqWTWjok/KsZMsxbOEswewqaP93TjVQgCXge4Wq8?=
 =?us-ascii?Q?pIUwla3rrQUX+BwbSVU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0503f7-fcb9-45af-83fc-08dabbb6abdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 03:10:46.7675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVZOKUANQOBlArbVOpPT+9BJyFolSHHoWjz4wcH/23VuKA/hLqDBCNXBIuZ/pj/W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7221
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Monday, October 31, 2022 9:54 PM
> To: Jun Li (OSS) <jun.li@oss.nxp.com>
> Cc: Francesco Dolcini <francesco@dolcini.it>; Peter Chen
> <peter.chen@kernel.org>; linux-usb@vger.kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-imx
> <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> philippe.schenker@toradex.com; Francesco Dolcini
> <francesco.dolcini@toradex.com>
> Subject: Re: USB runtime PM issues on i.MX6ULL
>=20
> Hello Li Jun,
>=20
> On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > -----Original Message-----
> > > From: Francesco Dolcini <francesco@dolcini.it>
> > > Sent: Friday, October 28, 2022 8:32 PM
> > > To: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org;
> > > Jun Li <jun.li@nxp.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Shawn Guo
> > > <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> > > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > > <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>; Felipe Balbi
> > > <balbi@kernel.org>; philippe.schenker@toradex.com; Francesco Dolcini
> > > <francesco.dolcini@toradex.com>
> > > Subject: USB runtime PM issues on i.MX6ULL
> > >
> > > Hello all,
> > >
> > > I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> > > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > > ("fsl,imx6ul-usbphy").
> > >
> > > The HW design has 2 USB interface, the first one is dual-role, while
> > > the second one is a host port with NO way to re-read the VBUS
> > > (USB_OTG2_VBUS is not really connected, there is just a capacitor to
> > > GND).
> >
> > How is your USB_OTG1_VBUS status? Can you try to make your
> > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your Host only
> > port test with runtime PM enabled?
>=20
> USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not really
> straightforward to do such a test.

iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2) as input to
power the internal USB LDO if I understand correctly, so you need change
your HW to meet this: for Host only port, you have to connect USB_OTG2_VBUS
to a valid VBUS and make it always present for simple. You can do some
quick HW change to prove this.

Li Jun
>=20
> Francesco

