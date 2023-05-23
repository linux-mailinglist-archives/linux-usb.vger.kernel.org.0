Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C4670CF81
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbjEWAj3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbjEWAbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:31:02 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E581A7
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:23:32 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKoMVg025652;
        Mon, 22 May 2023 17:23:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=16f+sezBjHBb9w4WnOUTb8kHBwyNMN1GPApK7erCBXE=;
 b=bIuDVUX4UrrJMA+IhktVkGY4jkPZ8h1eTK5IE38IvUwirf9Ac64UiBVxq/Mk9eCaHs2f
 Q4g/xVSyEYsQ+rLGCJj49HRkqv0xgwrh6UFqDOt2R7EkgplbiCKv9jBI2UiX9u5UrcAD
 PKS+vhb6Sf+aaNd83XtgjhrbNdYyBnI+1CemIaUZfhv5YCt0eVIXUa+BG7tSv/AHIe8x
 TaTolLYmVEelyaxrLd/Ded5WFQUgRPsIs+VnKCf8XHFliprhr5iVAqpDj/9YeDrUPvLA
 roVrXpTQ1goFhhsK68cUVUxVPU0NxoiPQGNi3jAZCs+67yQSCHllLmWaghr0TYCEJggo TA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qq11k951r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:23:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801402; bh=16f+sezBjHBb9w4WnOUTb8kHBwyNMN1GPApK7erCBXE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=aNoZnwyeFmksRFUB/Dtx7E+iJIK4w1WDhDC7T3uMETynSA1qS2SbFXW+zwZ5zqFlz
         jSfv/zHwUKvzH5+JfNFbnI9Ps4f60w3TfigfuiyB4RLVZgmcWZbm62WhS2xHUdH26A
         RDDgDw4/P2y/eK6fSDlC/myQNMgrteX6p1LeWIpBegcN6DXlNGd8qSFyuYkV7tju4W
         btWOhCaIBvf/WiOxMJ75eMLu67+4uawnRzuc2GUHMhBzhROxNAqCGEiTtOLvgkU4LE
         LEzlF90UZ+uDmELIFl+OKCZ8zcD7S9q1hZmLiLxPwanDJQmr3gEoGGdEkUDx5bl0Gl
         BT8eUcFpS10hw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE41E40637;
        Tue, 23 May 2023 00:23:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C60D8A0079;
        Tue, 23 May 2023 00:23:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eIKutV/s;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 81DBC405C9;
        Tue, 23 May 2023 00:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0vYd/0BdN6WT9mnASqcoco/cK+zrDE0fOWqb5nu581ReJyQXcYPolvCzbb+yM5jPULrBgGcm6e5Dw49bbsS77a83k4YxjTGC8Iv4UFVXQUtRE4psKfd3IpqjS4VJJDsMriLv46xLKwxQokN98wdXGqJL8CuhScM+5fKqH9peQ4iS29avJf/IeiCzkrd+ulr/pzsnH4CV1uHyxxoDKnVzBShDWcpLGciTnsKm9PunkRJZLiWsNUr6Q/mC3grXACkj5/lbIF8eLWsVfgCnYLHtKFeDy4esazkNiAnoqNcDC1XJ4K8+a0D64eRHmvy5WaFiTKW3azuNMpScUcuRklFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16f+sezBjHBb9w4WnOUTb8kHBwyNMN1GPApK7erCBXE=;
 b=DDklv3b/66LG7QQojI4JtSn95ou6m5/wzNCyf9uLSTA2+q5cSG7ifMcaObgBYerYpCp9JV3LGPN9Eo0gy4S+Zik+oX7zZGTiq85pPrp5qrfrG+8I0eUxFl5rDbaf46aQms19CO4MSLW071pCc+Zs3qBRg8JoJ+zx8TFKgqOUxd2quoes/IhqRXglJS0DOVLZWzIxCK1twZFX+a7WStdsG3flW2fDaLWBnkFf/J7qB5I9eDVTn14KI+eMPJpfqSyN+ZPQ+6eF6bU9NdlNQgFni1caD7UrfVhXgfXduwySLsU9EOcHuC+lLXLoXw/Fa2zBEL0uzGPa7zgf/7Uiz8WE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16f+sezBjHBb9w4WnOUTb8kHBwyNMN1GPApK7erCBXE=;
 b=eIKutV/szzGw4zEGPYr/ib/XqZ011C9SwCoOx44ysjwQqE4RKi8nkc2u29Vz9Ro3kB4LN2xEkbdNL1hswSopgekn1M9HW+jaA88maY3h/7I7uRy+r9m+7biLJmVLVLvFUl2IWqAC/3Muh3Nf2A77be+C68OQlpfcpFTA+H6t9ag=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:23:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:23:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 21/97] usb: dwc3-st: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 21/97] usb: dwc3-st: Convert to platform remove callback
 returning void
Thread-Index: AQHZiRO4DPohM2C70ka8lKI1Qy9nna9nB1oA
Date:   Tue, 23 May 2023 00:23:16 +0000
Message-ID: <20230523002310.hoxrmnuz2gijesqd@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-22-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-22-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: fd68bbc6-eb2d-4ba1-29b5-08db5b23e747
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zzpp6PtlxL/UkwoL2W+ODve/WOa/FzybVzpWP/fGAA1TpAGUzm5SHtW4NCTeoTg6fdTMR4dS9woUgcuqkGaU9P2BGbSPixC+DFRUZyUodW/7DgHCgIkdoYLjIG9eP0+uYjFpNXOntSKy/+AqW+gz1r0O18mIKvffuuv0eXveLbs5KSrhUrX0BkhLoAoJLcVB01izxrN9mi3l4LIHvowJwgb8E5Y8mZx68hxdJTCOUzCtOz8O0ogWWn2uxI8ECXRyh/5mN78gM3CGZZEtLIviQOMYl9lbk6tBpKFDJrcW/iXE1QicoKVU6uyJuzT3Ugdivomprr99mUvWaHjCXi3bqsNC63xFgPbhRtYa2MurdogeZ1QUl+ypFEIXTi+5hX2+PAmo5UhnYKgw63QiqoanGx5SKFYesPoK0adNrRVDste0HWfaIuKIJhKv1HRSdQCx6p3vSVvnMQcT5DioESXIP/uyiS0NDUO5C/WPkMQgsLbSW0Lc/YvxMyDM7wVbnPvguHK8iUbxMzD4vKR5KeHCSHzFydoHnOPJBgSTs21PVoO1uDRysV5WqWh98fd5i/5piE6+MaaP14kYVWVx8y60//Nohqzrzv7kR1MBIFy3j9EEBC6wzJtcPzB/fFEWc2wr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmNpZDVwRjhKMFVDYy8zVjN0N0pJc0kvY0thZ28rM2hmb1RNNXBxM0hPSHdF?=
 =?utf-8?B?SGJvdmw0ejFmTnNWT2g4NEJwcUc2TE1hUEtHOXl5c2FWR0xwd0d3ckQ1MXAr?=
 =?utf-8?B?cVpYVUNJN2FHcUJia0ZBek9wcE9temJhT1ljZVljN3ZmWUlKRnRyNng2L1Jp?=
 =?utf-8?B?akZ3YmlGZjBNNEJvVENBdHQ4aTNHMWpPaU9hWGxmM0ZuZDJ2bSt6anNYcHBn?=
 =?utf-8?B?Zm96N1hKYzVmTHJqeGp0S3ExS0tDanhRck52S2ZlVm9DYXlzTmpMdlVxUS9J?=
 =?utf-8?B?cGxiaEIraWZ2OXVYR2tYbEdKcWZNWWN3WFBQNWlPeDZXWXJNZVkweWVkdzAy?=
 =?utf-8?B?MVk0TkM3aDF3Y1RiWEpHVm5xbjJXTmMrUWxZYXVSSUVRYStLZG5LYkVvMWN1?=
 =?utf-8?B?OU5BM3lBbDdhaTBueVFONmhSNm1EbVFrTFYvU2x2SEZkdlVYbU5YTFRhQkNW?=
 =?utf-8?B?dmxKODJNY0FBOGNDYzE2MTJxRS96YlBqUFdodGZFWkx1eTBXcE52elFhUUVT?=
 =?utf-8?B?UjJocUdTRUtKd3U2SkV2MUw3aFBhQkgrZzR5THNMY2lGU1lDN2NTblJibkxX?=
 =?utf-8?B?R0ROeGltZm1NWG1Hc2VLRVhlS21GNEorRU4wcE4wV2pFK0lQQ1RpYXl0YlZV?=
 =?utf-8?B?ZmNpRncyWE5QNW4ya0dick5xdzZpVDc0UmlSUFAvb0ZZMllHU05VN1lxK2xG?=
 =?utf-8?B?MXc1ak94SzNqb2NzOFZiZlh2M3ZuNjN2SEpRM0kyVWNFY3RxL25JWm51Vkd5?=
 =?utf-8?B?RGZIWU93WlVIZVFiNXpKRDdwT2dOdFNBSnpxUnAyOVVsbS8zSHJjTkdmNzNP?=
 =?utf-8?B?cHhFSUR3aE5CajlhNkFuK3ExV3grYjdJZHI3NTB6MHhHUWlpelB5WmJVNHVQ?=
 =?utf-8?B?ampIbnNzckdlbEFsT1dQSUhOK3gyOG1DOTdZRElTZlgrT1BqckwwY1F6dUY3?=
 =?utf-8?B?YlJGS25hSGgwRTZDMlJXS3VUQWxYM29NMldjWUpZakduYWx2akVzbHhkbDlN?=
 =?utf-8?B?RkpoRzdNZHFobm8xa0RqVE5RUHJRZ0pOMld1NEF5K1l2dGR1azQxdVVCYXZ2?=
 =?utf-8?B?Nk0yVVRGL2dGbm9SWEhnTDFwSUF6djJrNnpXV1NhUDViZEhJOVZrdWVHTFNp?=
 =?utf-8?B?STkwemdnbWFua0FCcTR3RGJlcGkzeEZOSHdLQWdsc3lFVVpUNlZGMnR5WFQ1?=
 =?utf-8?B?N1hxS2NiVThnMXpJMWRoZlViblgxUXBZREN0L1ZwclZwNlVKN1NIUjNGbStn?=
 =?utf-8?B?THYzVEFkaWF2NTZzRVVkMWFMaXI0WndlZUExZjlqaXdyVVhrVjM3Y3g3QXZ6?=
 =?utf-8?B?ZGQ5clVvN1Jlc0FzSVJTQmU2bkJSeWZOOS9YZWtTZ2cwc21HdkVOdmxRUFVa?=
 =?utf-8?B?bkdsR3U2Y3g0dnU1T3N2NnA0cHpoSTFjeG5sRWlJQ3VkSk1mMUVVa2dZeng5?=
 =?utf-8?B?b2RWNVlZWWVoQm9BM3JZUjl3QS8rM1IyY1NUSFErQVdKZndZWXYrRzhMUjVG?=
 =?utf-8?B?UUZLRG9ONzR3WnVTQVQyK3BoZzVFSVB0SU5kRDVmNFNpZTFGOTJBM25UcnpR?=
 =?utf-8?B?MGxvWFNpUS9Cb3pzSHRNdGJTWGJJYWVjTHF1L2dzUnFuWWVOWWVTalg3NDAz?=
 =?utf-8?B?bjdFLzhjdzZ5Rk9wUU93elBROHFsRHlSK0FzV0pZVCt6d1lFQkVTZnVXdG82?=
 =?utf-8?B?VjFQSEJRaUt4WGoxRXNEUzBNcU5IazdscWlPWDdhVnpsNFhqeXRLMHVtSkJN?=
 =?utf-8?B?UW04dEhVZEJyNHRnNm4zWm1ZNENuWnlrdjl0K3Z6RW5UaXVBU2lma3BOTStK?=
 =?utf-8?B?OGthQzlsRXJlWVh1cjNIWUdDY01tVjdybUwvL3Y1dGV6MS8zbmFndmVxeVpm?=
 =?utf-8?B?ZU5LZGRVdG5vV21weW14NEI4Zmh5cCtpM1RXdXlHdC9BUk1vdHJEdkloOXNx?=
 =?utf-8?B?SGlyWWJKc2lZdm5LdGNqcmo4K2gzNVNUMTJJczlJTXRNTk1GbTUwZklwYzJx?=
 =?utf-8?B?YWcrdS82bXVDdmQrMUIzdW1LNW1udUgxcW9DNHRsMVhRTmNXMUkzNFRlWW9B?=
 =?utf-8?B?dHppTjRjb1hSSDZ0WmNpN21Rdm9KaUltcWlhTDQ3dVU4aDBBL003Skg0R3Q2?=
 =?utf-8?B?cEw5WlhWR1dTcWsxUHRqYnlSTlRPM2FacG85UTU0NWdjZXQxaDliNXJHSUJ2?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D067E7E7F63DB41B16CB8C3DD6C4F30@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?MXRMNjZYQ29VUEFBdm15ejB3SlNHTmhzczd5SGVPNUNTNW1SSXhiaDl2Q0tv?=
 =?utf-8?B?amRSbk1NMnJvTG5PMlUyMldLcTJpSk9SaUZ1RCtsRmkwSDR1bVc5dW9BYkFG?=
 =?utf-8?B?RVA3aEJMYmorelhwdzN2VHBzYk93S25PYm53VEVielVvOHQ2ZXV0amVsL1N4?=
 =?utf-8?B?dDRnTlNYVWdZdk9hRmV2NCtmMkRCN2pQTHo0RVFpNUZZMHk5emkwM1NnVFc3?=
 =?utf-8?B?d3NzY1JoWUkrL3RBNUhCWUZVbFdlVXg0Vm82aUk2bGo4VDBRQ1hIZ2orU2lN?=
 =?utf-8?B?RTZTenkzdnQvOVBjVFZYZVVhbmZFbUM5bURybmljV0h6THB3R3E2STR0N0gy?=
 =?utf-8?B?aGIyMHhlR2ZBbHphVWJGUDVQdGY0YUhlSEJDRkwvN2xDb2g5dUZxUDRNSTVn?=
 =?utf-8?B?MmRtRlJoZHBpZUhYWitjUm4zUFA3LzJDWThVSmMxMXlWelFqTTVUaXFRSkhH?=
 =?utf-8?B?bVljOVphWmNpcmdjMGlndDkxQSt2SnFkMXVCaFFGR042QlpGRzU5ejFMSEJs?=
 =?utf-8?B?VlNMZDl0amtDVVBBVlVvNUNSRW84RjhpNU51Nys2N0V5Qy96cVJxaURkVFEy?=
 =?utf-8?B?SkpZbVlKOUg1N284RkhOZzA1OGQyL3dEaEUrVVY4Q1NJYUl6TXZLV0x6clVn?=
 =?utf-8?B?UjRrQ0tHdTg3Y3lWUVJ2Y1B0MFFOMkVHa1hESHVzNDZwUG9BWnVnNElQVHpx?=
 =?utf-8?B?QWh6b083cmFLQyt5RmtKdXNtdW5Dc1JmQ1RNdFZKVUc5b3NnWUFtUnNnb1V4?=
 =?utf-8?B?REhLTngrYjRMR2JJbzM5UTNGWlZHUEhDUTNqV1JYS04xV24xZnU0R1Yrakta?=
 =?utf-8?B?T0NyYlNvNmdoZlliaEdJaWI0ZHJKNUttd2hpWmF3MHZHbFpaL2FycVk3UXNM?=
 =?utf-8?B?VkU2UmpUT3drTDIrMm5qaU5vbW9yYXl3cUVOTEFNclpQM3pEYzhXSmN1NEM3?=
 =?utf-8?B?SUxRY1dGeWJMT0t0SzR0aC9pVjZTYmtJTkl6TWd2Sjkwdk5nQWNaMXRxV1RL?=
 =?utf-8?B?eEt3TzA4aE9tRVBkQ01GbG5iYm5RZFI5c0NTSmdQK3dMQlhZSTJNUVN5WWFw?=
 =?utf-8?B?OEs2eTU0T29QMnYzYnFKdG5KVy8vYW1YMk1QNm1YSGVMMnF6cTZYdDc5elhX?=
 =?utf-8?B?dXdXa0NjTEVSZ0VmWStrMmFvOTZ2U3R3b3FoQ0lPRC83SitON0ZVN3UzajdR?=
 =?utf-8?B?WThrNGk0QWdDU1VkekFadkVqaUNZSHNhcTlCblVyWTNGSXFqSlk1eW1rWTlM?=
 =?utf-8?B?ckxxVjZDclRZV1VCVGEvRTR1QUVvYk15WGcrTHpaQUdoVVMwUXVnTCtSd2Na?=
 =?utf-8?Q?nPV0/FupiINto=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd68bbc6-eb2d-4ba1-29b5-08db5b23e747
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:23:16.4686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUIZ6OPO3Ufw5UBijUaRaShrVh5P5NCwOVE6O+UhKb7r6WtJDyCEC+SWtHnppVGcWkvc/+B4RYhbMgP3phhDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: TvPQpFgyQS1_Fs09Kz4EocbrWZaeAVnD
X-Proofpoint-ORIG-GUID: TvPQpFgyQS1_Fs09Kz4EocbrWZaeAVnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0LmMgfCA2ICsr
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1zdC5jDQo+IGluZGV4IGZlYTUyOTBkZTgzZi4uMjExMzYwZWVlOTVhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtc3QuYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtc3QuYw0KPiBAQCAtMzA1LDcgKzMwNSw3IEBAIHN0YXRpYyBpbnQgc3Rf
ZHdjM19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXJldHVybiByZXQ7
DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgc3RfZHdjM19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gK3N0YXRpYyB2b2lkIHN0X2R3YzNfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IHN0X2R3YzMgKmR3YzNfZGF0YSA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiAgDQo+IEBAIC0zMTMsOCArMzEzLDYgQEAg
c3RhdGljIGludCBzdF9kd2MzX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgDQo+ICAJcmVzZXRfY29udHJvbF9hc3NlcnQoZHdjM19kYXRhLT5yc3RjX3B3cmRuKTsNCj4g
IAlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzX2RhdGEtPnJzdGNfcnN0KTsNCj4gLQ0KPiAtCXJl
dHVybiAwOw0KPiAgfQ0KPiAgDQo+ICAjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+IEBAIC0zNjQs
NyArMzYyLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RfZHdjM19tYXRjaCk7DQo+ICAN
Cj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0X2R3YzNfZHJpdmVyID0gew0KPiAg
CS5wcm9iZSA9IHN0X2R3YzNfcHJvYmUsDQo+IC0JLnJlbW92ZSA9IHN0X2R3YzNfcmVtb3ZlLA0K
PiArCS5yZW1vdmVfbmV3ID0gc3RfZHdjM19yZW1vdmUsDQo+ICAJLmRyaXZlciA9IHsNCj4gIAkJ
Lm5hbWUgPSAidXNiLXN0LWR3YzMiLA0KPiAgCQkub2ZfbWF0Y2hfdGFibGUgPSBzdF9kd2MzX21h
dGNoLA0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
