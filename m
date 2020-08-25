Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACF4251E5B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 19:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgHYReC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 13:34:02 -0400
Received: from thsbbfxrt02p.thalesgroup.com ([192.93.158.29]:49918 "EHLO
        thsbbfxrt02p.thalesgroup.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726682AbgHYRdv (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 13:33:51 -0400
X-Greylist: delayed 394 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Aug 2020 13:33:49 EDT
Received: from thsbbfxrt02p.thalesgroup.com (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 4BbbXK2CjWzJyZC
        for <Linux-usb@vger.kernel.org>; Tue, 25 Aug 2020 19:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
        s=xrt20181201; t=1598376433;
        bh=zf5ZMVYAarnWFUqT1VbGnqOx5/B3pm5m4cOlp/Aa8PU=;
        h=From:To:Subject:Date:Message-ID:Content-Transfer-Encoding:
         MIME-Version:From;
        b=o7EORnByGSX9VEo6A6rqLkDUUTxoNf5L3BkA7KICsn0VGF61EgDU4Jv8XUdrPKDb7
         bywKpEsmSjy0WuPu3ep/zWyq0DANkAsSFKSdKhyM09v10BljoM89HsRdd78nSQDgkk
         Ds60QC5UZagFV1TRPoCysUPBNUzPV2Zk3rWLslMQNBJGFxFfhokzUe1q3Qv61+sFmE
         RHxsmTFjhsd5Y/sLByGDA6BVG5GbJnM7L71gfJgpgeCE83hM0QzvAEnGrcgCa+mtfs
         8hNch7ekyLci9C0zzbEjqT+24PFBNGGjCMAnDIjmqb2mG42cywDKvxmKU4TB57hQ9U
         j8F7LL9atxb1g==
X-MTA-CheckPoint: {5F4549A2-0-C52F090A-6656}
Authentication-Results: thsbbfxss02p.thalesgroup.com;
        dkim=pass (1024-bit key; unprotected) header.d=thalesgroup.onmicrosoft.com header.i=@thalesgroup.onmicrosoft.com header.b="jMvQw6hQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAUTQ4esJSa7BkzCDTN8cT2z4M/mKzV1DhlLbq3rsEDs/N3La6Kls3fhQbJDmlDM9IPqaVM177EScl0jjnW7SNMDnqEXJaP52cHOdlLMKdj+iE9oQHe3Rsr2/tE9QeFZ6GaDwFAsTVAefQ/Rrd/z/+PZqv+rilA1UPIqBOz4yzk8pR2GPkdh+FSmFEfwKsZt8/m+lbv0z0+MG+MFsX6aZWkpQwFngAh31OviwLXgxxwrdi5HoASZXe9kceERG17ObBvKISGexnb+XfSos1qxboD6RWXPR/Vfl42FAhVUleFG09LAWE409mMMUDcmcIcrffH9CSpipf2yDJzEQ9MXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf5ZMVYAarnWFUqT1VbGnqOx5/B3pm5m4cOlp/Aa8PU=;
 b=UhVrHeurM58G25rPFHn6YRSMCaLrDl9uI88q1tdKIgKrZ5DNn7pMdCsXDz6ZZ9Aa7Bl32w1ssg/hNukZwCIFz2QEzvUiB9LxmG4JwJcR8+5MUCRxLrP2E11WX6s5htR43kHEByGLAyKwf0Uhr3RrF8RDP2gftRV6XI2vgBvLEZp9nCMtgHLETlRPB3voZ69Le9DOZg12VlZqQWZVuMaEpdoN0bSSwHFOJsXfZtOJiacmAPvAIjz9aV8pgZ7HvzDZHYawF9nwR7LhD8otZ9lVj6SxWXPJj/82zoT35v6aDUbz/XfG9wDZ3U8JeZIrLpjnpxJHa6UUpt16mhDfFk5rgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thalesgroup.com; dmarc=pass action=none
 header.from=thalesgroup.com; dkim=pass header.d=thalesgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.onmicrosoft.com; s=selector2-thalesgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf5ZMVYAarnWFUqT1VbGnqOx5/B3pm5m4cOlp/Aa8PU=;
 b=jMvQw6hQlw3DXP+z1YJX9i9yVF9SGC0mD7Pguks2ODf2nLvAcOLXSjYsv281QG3HkR2mi20kWBamWGhgHG/OoLJuWJI7hxVaVCRTnmDttI8U+pmSWumccGIajddnBfTwoX6v92mxqJ0AhXDoBYHDEMGdtXSJ8mNOfhIUECBmlNU=
From:   GARG Shivam <shivam.garg@thalesgroup.com>
To:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>
Subject: Linux Crash with Gadget serial driver
Thread-Topic: Linux Crash with Gadget serial driver
Thread-Index: AdZ7Aw+onVx5vBMuRyOE8DOq7nQmHAAAc6OA
Date:   Tue, 25 Aug 2020 17:27:08 +0000
Message-ID: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=thalesgroup.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35954c7b-b25e-4c75-4e0d-08d8491c17f6
x-ms-traffictypediagnostic: MR2P264MB0644:
x-microsoft-antispam-prvs: <MR2P264MB064411CE5EF3466E0D1E9279F8570@MR2P264MB0644.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YAn8P06txs2VwksKUGWwykDAyUtNJ9rRnSPRmWLsbVvrqQdsERNNGsFmWGjpzEWF3WU1MMFOB4lrPw/kD44AfEIpwya8tvxOGEHgMSePkYa9k31iyTzkLoq6Hp5cLeCw049E8TfqdqEmhQUKI7Ah2zSmPKq+xk1y+nuYCNmc+CcXRtbVN48jMhA90CROpvRWHUbC3BzLffhdvyb/m1ZWchdVFv4RbZAyW50OOkOCVur/zi04QD+w3NllcAuGWB59Fie37AqGnonv13CODbjNr3LLBhuT7+QfsoNRVHfbRyLDseqaN+LSZUXK6Pb3anmr2CzNJpdXebRAwn7dsTyFog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(366004)(136003)(86362001)(52536014)(71200400001)(5660300002)(66946007)(64756008)(66556008)(76116006)(33656002)(6916009)(66446008)(2906002)(66476007)(186003)(83380400001)(4744005)(9686003)(7696005)(26005)(55016002)(8936002)(8676002)(478600001)(316002)(6506007)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Y1zMzEH+TNd0g5IFIpP6n0k2lcALAbp6wyMoCLfGe48QrRiklNqvQE2Igg4kSWrq5CE4wB7pOt1HkKvcNsHovJA6ToUkqJhuoiqFriKQf/VefnCTb/xlMae4S/h4brlyFxXVMIpeLqfk/Ce/4ydP+zUYbeF6dUrgRsHr85OzzypDhsDCRwmk5kYxfyYML+UA11HrEfTnx8yNwGRt1OWyFxwjUo3SoW3igZTSi0h8GPjNJeQ37kqnF9K6kBRmZUdIHiUr61kBaShbp0AiECeVcKGs4Rvlz5pJntC3PZz1C6H5n2iK5whBBQYzcNzwPbfGv/I9sps+u6OR8cjiiHWrvQapXI/vGslMjX4DG5wfN+NxYL/IiDaV54Ff0nC14/4PZhps6wTqTZXzItm3rc9JuiH+CXgfqRvwPO0s1KGaw42owVFKpaeYquS2bjZZNgwIIyUEHeNqjIf4edJWICUTAGBUYOiRZ+KgdkKg/VihmY+L+T/iWNY1Ox5tG1IhqzoT5ru7n3M8XihmqjJWByUZ8dGWwMzF+ZW3PW+9rj0pIUaHcasKfEVNKwFP9VKZYpoJ8ERXX5pj7w++m2xzG/UPeU75pFXsAS2V2JbCZtzn9CmvSTA0d/U9bz0FQwc+WTVPQLLJC9pw9wqfJqDi4tKQAQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Thalesgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35954c7b-b25e-4c75-4e0d-08d8491c17f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 17:27:08.1975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e603289-5e46-4e26-ac7c-03a85420a9a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BajyH2bn90N8ekyPZlD4UNpbPCz3828bmF9WPv8nkc0a607l8jEdbgRRUK1jF2B/0Z/ZIhcCaKHdeOKx0T1E640qFUkavmtc5OZpgRqr/u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0644
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.8.25.171817, AntiVirus-Engine: 5.75.0, AntiVirus-Data: 2020.8.25.5750002
X-Sophos-SenderHistory: ip=104.47.24.109,fs=408350,da=47090959,mc=6174,sc=1,hc=6173,sp=0,fso=45717861,re=62,sd=0,hd=30
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, SUPERLONG_LINE 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_500_599 0, BODY_SIZE_7000_LESS 0, DKIM_SIGNATURE 0, DQ_S_H 0, KNOWN_MTA_TFX 0, NO_CTA_FOUND 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, SPF_SOFTFAIL 0, SXL_IP_TFX_WM 0, WEBMAIL_SOURCE 0, WEBMAIL_XOIP 0, WEBMAIL_X_IP_HDR 0, __ARCAUTH_DKIM_PASSED 0, __ARCAUTH_DMARC_PASSED 0, __ARCAUTH_PASSED 0, __AUTH_RES_DKIM_PASS 0, __BODY_NO_MAILTO 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __DQ_IP_FSO_LARGE 0, __DQ_NEG_HEUR 0, __DQ_NEG_IP 0, __DQ_S_HIST_1 0, __DQ_S_HIST_2 0, __DQ_S_IP_MC_100_P 0, __DQ_S_IP_MC_10_P 0, __DQ_S_IP_MC_1K_P 0, __DQ_S_IP_MC_1_P 0, __DQ_S_IP_MC_5_P 0, __DQ_S_IP_SC_1_P 0, __FROM_DOMAIN_NOT_IN_BODY 0, __FROM_NAME_NOT_IN_BODY 0, __FUR_RDNS_OUTLOOK 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_XOIP 0, __MIME_TEXT_ONLY 0,
 __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __RDNS_WEBMAIL 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NO_NAME 0, __URI_NO_MAILTO 0'
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

My Device is a Linux machine that is having a Gadget Serial driver. Physica=
lly device side we have USB-C port while at host side we have USB port. Thi=
s device is used as COM port to access the serial port.

My Device side Linux is getting panic as soon as I attached the USB to Free=
BSD. Any view on this?

If I stopped the enumeration at FreeBSD using command (sysctl hw.usb.disabl=
e_enumeration=3D1), so device side Linux is stopped crashing.

Can anyone please help?

Thanks
Shivam


