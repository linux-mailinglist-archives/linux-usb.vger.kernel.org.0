Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88A15991B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 13:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfF1LUh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 07:20:37 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13903 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfF1LUg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 07:20:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d15f8030000>; Fri, 28 Jun 2019 04:20:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 28 Jun 2019 04:20:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 28 Jun 2019 04:20:32 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 11:20:32 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 11:20:32 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.57) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 28 Jun 2019 11:20:31 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB3415.namprd12.prod.outlook.com (20.178.196.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Fri, 28 Jun 2019 11:20:28 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::707b:7560:5f8b:ac27]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::707b:7560:5f8b:ac27%5]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 11:20:28 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Topic: [RFC] usb: typec: ucsi: add support for separate DP altmode
 devices
Thread-Index: AQHVLXV0VsNXIAykxkWsOg+7eAcM4Kaw4qaAgAAJaXQ=
Date:   Fri, 28 Jun 2019 11:20:28 +0000
Message-ID: <7654ACFE-FB50-4485-9001-D6AB53D2C6DA@nvidia.com>
References: <20190628054547.26764-1-ajayg@nvidia.com>,<20190628104647.GD21701@kuha.fi.intel.com>
In-Reply-To: <20190628104647.GD21701@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [67.160.205.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deeebf61-eb35-4b71-88fc-08d6fbba9fc5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR12MB3415;
x-ms-traffictypediagnostic: BYAPR12MB3415:
x-microsoft-antispam-prvs: <BYAPR12MB3415E2F1282D22B2634E6D2BDCFC0@BYAPR12MB3415.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(53546011)(6916009)(7736002)(2616005)(316002)(4326008)(8936002)(53936002)(86362001)(6512007)(14454004)(2906002)(33656002)(54906003)(5660300002)(6246003)(25786009)(6436002)(3846002)(66556008)(66446008)(64756008)(76116006)(486006)(99286004)(256004)(6116002)(446003)(73956011)(66946007)(14444005)(81166006)(229853002)(71190400001)(8676002)(478600001)(76176011)(102836004)(6486002)(66066001)(68736007)(305945005)(186003)(36756003)(66476007)(71200400001)(26005)(476003)(6506007)(11346002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3415;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tBnqH+NyFb/EK1ET5+npEQdYZkF9DPvexLv78EUyoSeGETcsLLUkRFAw1aITAYrd95F55zexEqNBHXCY7d/rOSfrOTKpAbm/XfVMdCWvvvFCk0Fqh1selt9C3DhOJSSnWF6NLptXYt6sk5O0NLSCaZxhl2hDJM/gg/eE8Dvor+JPlET5GsXv8ME9aaoTQ4Ce4q9I0Ev0P+dxbV3dgxGoe2Uan1iWQ/OyUFLQyZjJbsQ5PThXJM+NAQR3xBEa3y7AevxE/7pgDwM5nsYVhtS/aNqklabi2l8jsYfIEqO6zOCbxxufo5KDnVP3rt+t2jWG1IPrXt3ypn+ou9ydtBZgNpXVzI/AjOKhOtUOnHN80Mk22vaIBQnWyOsFAEYidMbXgKtcdWdmM9rIvJWRTKm8sIceBb0Ewq0Pt7fA2k5c8gM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: deeebf61-eb35-4b71-88fc-08d6fbba9fc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 11:20:28.1096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajayg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3415
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561720835; bh=jLHxMrvYsAnfxjGhPqYxrQs8HnbPeEYVaY+7lF6NG8M=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-microsoft-antispam:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=ei3DmOrC6+wtRlMlFZxfWboH36xeNZ48mML50eenYLrBE1dqsSq8z7+iRiSw+sRe2
         eImrFYGidJOL9ZGxaY5ehUCKGWTxkLkX0our/6NUbIsJBpCL7CyBsCf+efwmWm6NnB
         8XX/mzqq2W12zoE25h1J216EWlaNTWk8t6+LvOmeSQyS5PGRj568NUmq5JsnqEro7I
         INyohP4lAITY99HZywCfmSOPpRdokEIN5WHthRec0hDjbrMbnXQfxENgwDthZpTdbY
         m3PG3VaTRbcvZkX2svd3MLLTT9Es2P/ijnuXm9CF7x5gn+xL/2q/y0kWZeFb3D+8qB
         O2CBHStxL/QGw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

> On Jun 28, 2019, at 3:47 AM, Heikki Krogerus <heikki.krogerus@linux.intel=
.com> wrote:
>=20
>> On Thu, Jun 27, 2019 at 10:45:47PM -0700, Ajay Gupta wrote:
>> CCGx controller used on NVIDIA GPU card has two separate display
>> altmode for two DP pin assignments. UCSI specification doesn't
>> prohibits using separate display altmode.
>>=20
>> Current UCSI Type-C framework expects only one display altmode for
>> all DP pin assignment. This patch squashes two separate display
>> altmode into single altmode to support controllers with separate
>> display altmode. We first read all the alternate modes of connector
>> and then run through it to know if there are separate display
>> altmodes. If so, it prepares a new port altmode set after squashing
>> two or more separate altmodes into one.
>=20
> I don't have any better ideas how to solve this at them moment.
> Therefore, I don't have a problem with going forward with this.

Thanks, please review the change and provide any comment. I will anyways re=
post this as a patch.

Thanks=20
> nvpublic=20
> But
> please note, that we are already at -rc6, so nothing is going to
> happen for a while. I'll away for the next four weeks.
>=20
>> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
>> ---
>> drivers/usb/typec/ucsi/ucsi.c | 191 +++++++++++++++++++++++++++++++++-
>> drivers/usb/typec/ucsi/ucsi.h |  12 +++
>> 2 files changed, 199 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi=
.c
>> index ba288b964dc8..491b5c925a90 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.c
>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>> @@ -39,8 +39,27 @@
>>  */
>> #define UCSI_SWAP_TIMEOUT_MS    5000
>>=20
>> +static void ucsi_update_get_current_cam_cmd(struct ucsi_connector *con,
>> +                        struct ucsi_data *data)
>> +{
>> +    u8 cam, new_cam;
>> +
>> +    if (data->cci.data_length =3D=3D 0x1) {
>> +        cam =3D data->message_in[0];
>> +        new_cam =3D con->port_alt[cam].linked_idx;
>> +        data->message_in[0] =3D new_cam;
>> +        con->new_port_alt[new_cam].active_idx =3D cam;
>> +    }
>> +}
>> +
>> static inline int ucsi_sync(struct ucsi *ucsi)
>> {
>> +    struct ucsi_connector *con =3D ucsi->connector;
>> +    struct ucsi_data *data =3D ucsi->ppm->data;
>> +
>> +    if (data->ctrl.alt.cmd =3D=3D UCSI_GET_CURRENT_CAM && con->has_mult=
iple_dp)
>> +        ucsi_update_get_current_cam_cmd(con, data);
>> +
>>    if (ucsi->ppm && ucsi->ppm->sync)
>>        return ucsi->ppm->sync(ucsi->ppm);
>>    return 0;
>> @@ -101,14 +120,57 @@ static int ucsi_ack(struct ucsi *ucsi, u8 ack)
>>    return ret;
>> }
>>=20
>> +static void ucsi_update_set_new_cam_cmd(struct ucsi_connector *con,
>> +                    struct ucsi_control *ctrl)
>> +{
>> +    struct new_ucsi_altmode *new_port, *port;
>> +    struct typec_altmode *partner =3D NULL;
>> +    u64 cmd;
>> +    u8 new_cam, cam;
>> +    bool enter_new_mode;
>> +    int i, j;
>> +
>> +    cmd =3D ctrl->raw_cmd;
>> +    new_cam =3D (cmd >> 24) & 0xff;
>> +    new_port =3D &con->new_port_alt[new_cam];
>> +    cam =3D new_port->linked_idx;
>> +    enter_new_mode =3D (cmd >> 23) & 1;
>> +
>> +    if (cam =3D=3D UCSI_MULTI_LINKED_INDEX) {
>> +        if (enter_new_mode) {
>> +            port =3D con->port_alt;
>> +            for (i =3D 0; con->partner_altmode[i]; i++) {
>> +                partner =3D con->partner_altmode[i];
>> +                if (partner->svid =3D=3D new_port->svid)
>> +                    break;
>> +            }
>> +            for (j =3D 0; port[j].svid; j++)
>> +                if (partner && port[j].svid =3D=3D partner->svid &&
>> +                    port[j].mid & partner->vdo)
>> +                    break;
>> +            cam =3D j;
>> +            new_port->active_idx =3D cam;
>> +        } else {
>> +            cam =3D new_port->active_idx;
>> +        }
>> +    }
>> +    cmd &=3D ~(0xff << 24);
>> +    cmd |=3D (cam << 24);
>> +    ctrl->raw_cmd =3D cmd;
>> +}
>> +
>> static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl=
,
>>                void *data, size_t size)
>> {
>>    struct ucsi_control _ctrl;
>> +    struct ucsi_connector *con =3D ucsi->connector;
>>    u8 data_length;
>>    u16 error;
>>    int ret;
>>=20
>> +    if (ctrl->alt.cmd =3D=3D UCSI_SET_NEW_CAM && con->has_multiple_dp)
>> +        ucsi_update_set_new_cam_cmd(con, ctrl);
>> +
>>    ret =3D ucsi_command(ucsi, ctrl);
>>    if (ret)
>>        goto err;
>> @@ -364,10 +426,24 @@ static int ucsi_register_altmodes(struct ucsi_conn=
ector *con, u8 recipient)
>>=20
>>    for (i =3D 0; i < max_altmodes;) {
>>        memset(alt, 0, sizeof(alt));
>> -        UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con->num, i, 1);
>> -        len =3D ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
>> -        if (len <=3D 0)
>> -            return len;
>> +
>> +        if (recipient =3D=3D UCSI_RECIPIENT_CON) {
>> +            if (con->has_multiple_dp) {
>> +                alt[0].svid =3D con->new_port_alt[i].svid;
>> +                alt[0].mid =3D con->new_port_alt[i].mid;
>> +            } else {
>> +                alt[0].svid =3D con->port_alt[i].svid;
>> +                alt[0].mid =3D con->port_alt[i].mid;
>> +            }
>> +            len =3D sizeof(alt[0]);
>> +        } else {
>> +            UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient,
>> +                             con->num, i, 1);
>> +            len =3D ucsi_run_command(con->ucsi, &ctrl, alt,
>> +                           sizeof(alt));
>> +            if (len <=3D 0)
>> +                return len;
>> +        }
>>=20
>>        /*
>>         * This code is requesting one alt mode at a time, but some PPMs
>> @@ -521,6 +597,103 @@ static void ucsi_partner_change(struct ucsi_connec=
tor *con)
>>        ucsi_altmode_update_active(con);
>> }
>>=20
>> +static void ucsi_update_con_altmodes(struct ucsi_connector *con)
>> +{
>> +    int max_altmodes =3D con->ucsi->cap.num_alt_modes;
>> +    struct new_ucsi_altmode *alt, *new_alt;
>> +    int i, j, k =3D 0;
>> +    bool found =3D false;
>> +
>> +    alt =3D con->port_alt;
>> +    new_alt =3D con->new_port_alt;
>> +    memset(con->new_port_alt, 0, sizeof(con->new_port_alt));
>> +
>> +    for (i =3D 0; i < max_altmodes; i++) {
>> +        if (!alt[i].svid)
>> +            break;
>> +
>> +        /* already checked and considered */
>> +        if (alt[i].checked)
>> +            continue;
>> +
>> +        if (!DP_CONF_GET_PIN_ASSIGN(alt[i].mid)) {
>> +            /* Found Non DP altmode */
>> +            new_alt[k].svid =3D alt[i].svid;
>> +            new_alt[k].mid |=3D alt[i].mid;
>> +            new_alt[k].linked_idx =3D i;
>> +            alt[i].linked_idx =3D k;
>> +            k++;
>> +            continue;
>> +        }
>> +
>> +        for (j =3D i + 1; j < max_altmodes; j++) {
>> +            if (alt[i].svid !=3D alt[j].svid ||
>> +                !DP_CONF_GET_PIN_ASSIGN(alt[j].mid)) {
>> +                continue;
>> +            } else {
>> +                /* Found duplicate DP mode */
>> +                new_alt[k].svid =3D alt[i].svid;
>> +                new_alt[k].mid |=3D alt[i].mid | alt[j].mid;
>> +                new_alt[k].linked_idx =3D UCSI_MULTI_LINKED_INDEX;
>> +                alt[i].linked_idx =3D k;
>> +                alt[j].linked_idx =3D k;
>> +                alt[j].checked =3D true;
>> +                found =3D true;
>> +            }
>> +        }
>> +        if (found) {
>> +            con->has_multiple_dp =3D true;
>> +        } else {
>> +            /* Didn't find any duplicate DP altmode */
>> +            new_alt[k].svid =3D alt[i].svid;
>> +            new_alt[k].mid |=3D alt[i].mid;
>> +            new_alt[k].linked_idx =3D i;
>> +            alt[i].linked_idx =3D k;
>> +        }
>> +        k++;
>> +    }
>> +}
>> +
>> +static int ucsi_get_altmodes(struct ucsi_connector *con)
>> +{
>> +    int max_altmodes =3D con->ucsi->cap.num_alt_modes;
>> +    struct ucsi_altmode alt[2];
>> +    struct ucsi_control ctrl;
>> +    int num =3D 1;
>> +    int len;
>> +    int j;
>> +    int i;
>> +    int k =3D 0;
>> +
>> +    memset(con->port_alt, 0, sizeof(con->port_alt));
>> +
>> +    for (i =3D 0; i < max_altmodes;) {
>> +        memset(alt, 0, sizeof(alt));
>> +        UCSI_CMD_GET_ALTERNATE_MODES(ctrl, UCSI_RECIPIENT_CON,
>> +                         con->num, i, 1);
>> +        len =3D ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
>> +        if (len <=3D 0)
>> +            return len;
>> +
>> +        /*
>> +         * This code is requesting one alt mode at a time, but some PPM=
s
>> +         * may still return two.
>> +         */
>> +        num =3D len / sizeof(alt[0]);
>> +        i +=3D num;
>> +
>> +        for (j =3D 0; j < num; j++) {
>> +            if (!alt[j].svid)
>> +                return 0;
>> +
>> +            con->port_alt[k].mid =3D alt[j].mid;
>> +            con->port_alt[k].svid =3D alt[j].svid;
>> +            k++;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>> static void ucsi_connector_change(struct work_struct *work)
>> {
>>    struct ucsi_connector *con =3D container_of(work, struct ucsi_connect=
or,
>> @@ -851,6 +1024,16 @@ static int ucsi_register_port(struct ucsi *ucsi, i=
nt index)
>>    if (IS_ERR(con->port))
>>        return PTR_ERR(con->port);
>>=20
>> +    /* Get Alternate modes */
>> +    ret =3D ucsi_get_altmodes(con);
>> +    if (ret) {
>> +        dev_err(ucsi->dev,
>> +            "%s: con%d failed (%d)to get port alternate modes\n",
>> +            __func__, con->num, ret);
>> +        return 0;
>> +    }
>> +    ucsi_update_con_altmodes(con);
>> +
>>    /* Alternate modes */
>>    ret =3D ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
>>    if (ret)
>> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi=
.h
>> index de87d0b8319d..7bbdf83c8d4a 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.h
>> +++ b/drivers/usb/typec/ucsi/ucsi.h
>> @@ -274,6 +274,15 @@ struct ucsi_connector_capability {
>>    u8:6; /* reserved */
>> } __packed;
>>=20
>> +struct new_ucsi_altmode {
>> +    u16 svid;
>> +    u32 mid;
>> +    u8 linked_idx;
>> +    u8 active_idx;
>> +#define UCSI_MULTI_LINKED_INDEX    (0xff)
>> +    bool checked;
>> +} __packed;
>> +
>> struct ucsi_altmode {
>>    u16 svid;
>>    u32 mid;
>> @@ -408,6 +417,7 @@ struct ucsi {
>>=20
>> struct ucsi_connector {
>>    int num;
>> +    bool has_multiple_dp;
>>=20
>>    struct ucsi *ucsi;
>>    struct mutex lock; /* port lock */
>> @@ -424,6 +434,8 @@ struct ucsi_connector {
>>=20
>>    struct ucsi_connector_status status;
>>    struct ucsi_connector_capability cap;
>> +    struct new_ucsi_altmode port_alt[UCSI_MAX_ALTMODES];
>> +    struct new_ucsi_altmode new_port_alt[UCSI_MAX_ALTMODES];
>> };
>>=20
>> int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>> --=20
>> 2.17.1
>=20
> thanks,
>=20
> --=20
> heikki
