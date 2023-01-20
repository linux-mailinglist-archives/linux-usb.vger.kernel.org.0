Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0F4676154
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jan 2023 00:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjATXP4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 18:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjATXPw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 18:15:52 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0F76ACBA
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 15:15:50 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KM5Ok8007246;
        Fri, 20 Jan 2023 15:15:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3zfSs8elDld/o4eSRu42GG40HPL8T6Wvli5aRwGPW3o=;
 b=HQ4rca4c4yxwY0PhALIounOrDwdD+XMqT1zBBjSMmKwfrKLpuN98ccOOA7w+Mi1THhxH
 NGG2aRrQLckR2zQn4KpyvnnIZSLKa41pXYzh/3fA5FBULMsFyjyM53sUY7izBsF2Q6qG
 HZd9YwRp2W9zTCzXjeDbjXvAOmORSz3IkUSM5zrgDf8FgifY8Rk04snueWdMJNHTaC8/
 3KetqPIgcP64xT4F4o+Vkwb1oSYyCKCdEHNr5EZbRkPKHU+cW1/Qw6gy+cc39HPfirS+
 +Z116XR5UpIpMNofWeWMFVQHLHvdcSJVxRh5sNUOpTErNX4XLmNzRzczUNEX4w8vrKu+ bw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n78wv9psu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Jan 2023 15:15:45 -0800
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3819840088;
        Fri, 20 Jan 2023 23:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1674256544; bh=3zfSs8elDld/o4eSRu42GG40HPL8T6Wvli5aRwGPW3o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cH3k70mMgGto2kj+/7vSe+wRO0t99ycLRiN3L1qre40kmp4gOjtyIESNHrD0Hs/K8
         iV6gs7uySe+TN11BUhxjv8vUvCy+GoWuXyNPQ1vLs476oxWEKvwh86hl9hhocnQOlQ
         HHp2RikgsH4p/cHncY7aOdJA5Qzji7IcFEZScl87a1m2GiCTLk0LgCsBZGbFBuh25G
         iNVvwEBUmzf7jSgbn9xaQ/87bVxqzCXJWOWd+B3avEIRPPw2GgAY7/guiEYIF9TV7M
         wks+b0x4TRQ0CcClo1mIe1nhTL0EtyWQMXHPqvqlmf5hI6fkkbyOU2n1q0OQRt0Qh/
         cuq2XokwSX6ZA==
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D6B80A00BC;
        Fri, 20 Jan 2023 23:15:43 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 64179A03F0;
        Fri, 20 Jan 2023 23:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1i9yJKBu3Q9QycnuWDmu9Ip7+s8aKED2T+LYpT+ABlGnUcoCvtX8x+GRA9DXdA/ZD28XwqsGFdM/UfDEs0L2MZBy1L4YcAL8mkeDdZR6PFnjSOd74fZSJgo0FlQl1BM5CvmkRbQsWRH7aHCmwM2CY7bfVCLnRsGyFZ0FguIcEiRC6FZIhCjyD5WM0PK8xBBxOr6FB+uku7pnwuuwpNwWaC0w7xFto+iyWRF+jf7c1uxOiUsh0xpkP89PcnxYtlLHYyZabKK8np1qnP/mHY6dHz9dPMF0gcGaLd+C78kfI/SvupNB6gjTPAGImZ8MQW+LPVK3rUWPsDvnTFUSMfnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zfSs8elDld/o4eSRu42GG40HPL8T6Wvli5aRwGPW3o=;
 b=f7pFUTEIm6p0YbYS3qpdFWSgzO40l9HTtyFDKN7lypKf1mUG6D0C0+uzcgeoOuGhy1Vtkon1AI4m+RA6xd8BvmDo1kOpXlq7QEfhRc0IXnOATE/AZ1P8XvlGA+S+WnvmfxSwmWKP9Dfv0TXPLcn1uSQnwQAeHw9t4gwM901W8nbc2GtXrXCn3DnGjt6Da7KFsZDz7dre/GlA099oKjVXy6+xd+Kh3L5btm8O/SAmV7FNE5rQGMmigDg/Ok8fRiEvcMH+WKh5U/HjqJq+jgmX6R2x3UnDYIgtPbqo0UXdynU6320WYcpW+MZWxyPvm3O0FsssfT0WCmKt0v6D/edwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zfSs8elDld/o4eSRu42GG40HPL8T6Wvli5aRwGPW3o=;
 b=vt4hCw5vpkgXB2m9N8++xMkDit9WT/nUgCSNbBz8r/K4pZuMTMRPij6dwiLJNiYfbbS8+PvXOrfr5uVMQs9B6MMYaHY85KiimmNvvTXviX4LHYHBosR28wG2obLj1rQ8sRBYRoc7iRj9+9cXXdkq7nrMq/2QcOl2P/58+Wjbu2U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 23:15:40 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Fri, 20 Jan 2023
 23:15:40 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbBPDcqFUUga/0S7en4fefnHfa6Vct4AgAACR4CAA2I5gIABN2uAgAGE/ICAABi+AIAAC3OAgAAB+wCAACFWgIAACJoAgAEinYCABniqgIAEh6OA
Date:   Fri, 20 Jan 2023 23:15:39 +0000
Message-ID: <20230120231529.ch4ksfpoaqcms2oq@synopsys.com>
References: <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
 <20230113010841.ougwmotzlm56nciz@synopsys.com>
 <68d3e800-afe6-9e27-e4e4-3670696abd9a@quicinc.com>
 <20230113031813.zozc3v4m2m3jybrb@synopsys.com>
 <f11c96ce-1ae5-8f59-6d1a-3b35cf45f301@quicinc.com>
 <20230113052437.faywn7ev4bop4q5i@synopsys.com>
 <d89d472f-14be-821f-7da0-c82031efc651@quicinc.com>
 <20230113231533.yzspircp5nicrzkc@synopsys.com>
 <043976da-83dd-e3ad-1554-1ee4906a1e7a@quicinc.com>
In-Reply-To: <043976da-83dd-e3ad-1554-1ee4906a1e7a@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA3PR12MB7949:EE_
x-ms-office365-filtering-correlation-id: 970c661b-f08a-4184-9b63-08dafb3c3ed8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6KOEpWhb1qTUsXsOxmuMuSPAUaDYPlCJ0Sfj0zvasqWZ4QDlGMloPSkUy4SsBVrOK8CcTQCPp+Y9TRQyV9P63y/ffwqvT9TbxLg5fGG97TmYt25eX/woOQxqXjk++q3mJwv+zlqHchdBaj+njR4pzo70LI5CK9aSMMvgbITbNANrVGDtupgHaImxpn6XWhEDEuXitOKOF8XSp30ioJbxVGFuRRUW1dEAag1IBGuPaymu5YdLWu9GH/5ZX34R6fNNoz+XChQAvqCv6YWeriWg1chsBw6tm8AOTfBf4yFLAdOqp6/pfg4teaWyGusrtyYJslBErfq2D6sLfD+s4VNH3uUTtxVtC6c/uTY0dIuGZQ64ScfOPlplbrNOU1h/orcH0S0dBGk75Yv+HKwvJFA40L1LQNFri6ZbW/Zq8BMmS1ySpdBuI/Nss6Y7XMTKK8QcAoiEzhu8963dl50VCyRJINXHQ8nOJ8V5mkVzZqtuk4xLndoMriOXg2lcNK+8R405dC/VkZNg4+5ytq6RnriuY/NA01XpkR7KzfURqcMOKjJUhFQUhOaL1ilOyVziO/vTPhh4Qd0u5NhqKRwVprUzanb8R+ibPYPjKXXMHunYHZ23PLm8Yf9u6wzryP2hQoYjQTdA2Tb0jbumk1EdcwRwsRbnEKLsdqO3hKyaj/8RvmYPbPa0ePEXck2qmvszztRicICjOe7TGsbPvW030OWAnZt+w1kkzd+70gHEeRJsrp4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(5660300002)(8936002)(4326008)(66476007)(64756008)(66556008)(66446008)(8676002)(66946007)(6916009)(76116006)(71200400001)(38100700002)(122000001)(53546011)(6506007)(186003)(26005)(54906003)(2906002)(6512007)(6486002)(966005)(316002)(478600001)(36756003)(2616005)(83380400001)(41300700001)(38070700005)(1076003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlRwcExGSUFzTU9lcWtwU2JFZExVQTlqbFFUOTBtV2plMlB4RFpVeUhvWXFX?=
 =?utf-8?B?Vlp4QXhod2E4N3BXTnZpTUc0ZjNCMVV4cmVraElzVy83WS9NMG9qMDJPVklv?=
 =?utf-8?B?ejNvYlA3Q1BFcmxiZjlEOUhKbEtTZitRWndxSjlUZnd0dUtxT2pyaDROZ1VI?=
 =?utf-8?B?T2ZIT0NlMWtwTXFJOWlEbnhXZzRHdU5MSTMxdXFsOGdKS0hPM2U5ejFWeVh2?=
 =?utf-8?B?N3lBRE15RWpwb09Lc2xMUkVrVDRQcDRQdllrZDJqUUhBNis0UDVzdkpla0hT?=
 =?utf-8?B?Mk5kbnFKTHhYNjYvM3BBMkNUWGhORGQzZk5VaitaRTVRT29MdXVMTzI3WmRz?=
 =?utf-8?B?SlVmaWt6ZzdsSm02U0R4dVphbVN5Y3o0dDJuUTZ0Wjc1SWl5cHdMYjdFWURW?=
 =?utf-8?B?L0pIR0lqZi8yaEt1M0xuaUkyVUdOVGdWeTkrOE5LeE9LYlhhQTYzbUx5RDl5?=
 =?utf-8?B?SkgyTG1mVml1SzNCcE8vRkcyVlRFUWluQUlYTjlmbHU5MFJBVzlBMGhMc0Zy?=
 =?utf-8?B?OUxrMlc5Rnpna3NEbFRMSFY5UmRCd1B3VGFoV2Z0M25HczdIbUV1anF3U0Vs?=
 =?utf-8?B?MW1FUjV2UWI1Q05iMFdqcjEybkw5ZXpnQThYS2syVENYS1BGR3A1Zko0aGtD?=
 =?utf-8?B?MzF2NVB0R2daSE54TUEwU0xNeHRhVEFIL3llSjlzQTAvZFRQMXBWMGd5QWRt?=
 =?utf-8?B?ay9JTTZUK3k1dFUySjRFSVFSNCtSVjYxYkk4WkxhRTlRWE83c2I1MWxFWEVl?=
 =?utf-8?B?aVlRWUVNalFETEJodlA5OFlXMmcvZEtRUU43ZHFMVk15T2NjVjhaRks0YnMr?=
 =?utf-8?B?QWFnOVlONzEwekUrZHpVUC9oR0xVMW9SMktaQ3Z2a1hQMENBUlR4dzVwNWtD?=
 =?utf-8?B?V1hPRGdQbFZVak9EYjNzdEc3clhxcnlIOUZScVBwREdoR0FLdmtWbE9Ba2F5?=
 =?utf-8?B?UG1XYnNNV0FMcUlaZ0tEUDVVZDZzWFluYnRYV1F0MzdtS3V0V1JycmdVRmN0?=
 =?utf-8?B?RjE3V2MvM0RoWkZCM1VVVXE3QWpRancrMVM0SkpPMExneSszdXJCUHRaS2tG?=
 =?utf-8?B?dFVBUGh2T2NuY3pBb2Zac1JLOGdvc1RoV2gxWmtGa0pybG4vcWFuMW1EOTBi?=
 =?utf-8?B?SVl0d09taHg2cUE5V2RLM296RG85dno5c3ZVeXFqRkFoZWdUQ1c1Z0k1eHdF?=
 =?utf-8?B?YlJOV0xlanlSTjlWcElsYjJjY1pNd3YrOGJxclJvblkwc05ZZ014bk9xNzc1?=
 =?utf-8?B?YXNIczQ0MVdhRXRDV0J5RXJHQ1FFVFIvOHdSUjNnR09HNXFoMVZiZTlCZXZQ?=
 =?utf-8?B?K1o2M0s5a1cyc2E2cnFSSEFpYjljRUs5YzM0b2ovKzNVa1F1cFJBYTc1c2Ro?=
 =?utf-8?B?WGF5eUl1ZjJPZ1JvNzloekZadWhNcnFWTjBWWkRlcEpHQmNURk96L3VtRkdQ?=
 =?utf-8?B?MkpKNjVZSzI3cjlNWDBtMkdqUk8rMk96cUwyd3g0WEl1RHcwMG9SdnlEMFdz?=
 =?utf-8?B?eHlHbzcyc09RbldDc1J4SXNOMjV4OGlZbTlwakRqRmVzbnRXMnFYb0tvRDV5?=
 =?utf-8?B?NGs1SjB5YTR3TmtwSWNhMHd2a21rS1RKK0tDUzh0L2cxYkNnMW1uRkJxeFBS?=
 =?utf-8?B?VXdnbjhTb1RBSlpnSm43a3dJSi9NOGpCOEtTM1ExaDdtZlh5R1NOOXVkS3kr?=
 =?utf-8?B?YzFQcEI5TGZsdUJtVFJpRlFXTlM3cnFGSTdmeVY4MVA0d2E2L2JsSk4yRDlE?=
 =?utf-8?B?Nk9Vd0lpYmhqSnVIcFlmcWRBYkpILy9BN0VZdm1COGRXUTZPdVE5SFRTU2k5?=
 =?utf-8?B?T1k2emdsbDBCWStiVnh3d3RhS2RQc2NkV0NsemEyajFjcDJDcDlkVVdhekJv?=
 =?utf-8?B?TFVocTBwR1hIdnpZSTNIbmNqUFE5STJBajdFRWVtek1iQkFsc2ZrRHVBMm1F?=
 =?utf-8?B?Mmt3aER4dTFHa1VwMWRHWWNSV21RR2F0NlNhOEhMY2FFOGJKdmxRUmI5V1c0?=
 =?utf-8?B?QmR3MjN5VG90RXpLRk1FekU0enlyVWhzQkUrdlhTL1VVNm4wajJGenhITzJv?=
 =?utf-8?B?ZkthSHVPQVVjTlI5UTg5UElQQXVPVUp4RGozU0dKcTJBYW1LN0V4NkRvQ2NJ?=
 =?utf-8?B?NGduVkI0eFpYZGlTeWhXd3J6ZVRnQll1ekxacGZHUG5ydFNVMEtUcGdmejdC?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AAAF545A5513F41AFA7EA2882FB7B7F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zTxcwSx7W+Xav3OAn/zSl3uB7/aR/TRp99yY+1fZTNj1ZO9p3Q62vpKQjMdww9a0tIptrIuX8aYMiqA+I1xcFldwgv7IUwG3BmumRtnIrKo+kOjKfa6JPZSWNf0HrwBlzj3p7J4iuKLZ6lAmELLRIlqeItPs2nfRovgxLVBvbw+47U8CXL4c82iR8LKhixItdEPtMipfsCX9YUW57rdX/Imj6UPVbD3AM6n7wipaUEct7JfBl6QGUSixsOaV86Ax74ZnOTiWsiGJMgKUHS/Iv3h+aF7vO3vO7oPjtvSxEllUp9y7Im0zzMifRfVkvOsry+4744x8b2rkAGfUeUIcPKdmBRcMNxM70G1U4VYwzKkeViVHOIWyaHZMXCd0tnYsjtcS3GMXJjixMFv/SiBFaNWM4J15rHGTHXenD+SQxCaKACmiRTZvOwejEYtpFZzebbM/zPq+Ge1nfFHndVLPznI/gY1uG13aaAorGllvghWpzepvIjByxWAKuylxZQA6zT7IiRYLN8fupXe6T1RnjKY4Ie4GHoIfuDS9Ulzl5MKhjZzb2IItRZz7hboOQ2nqnBootG2dfYpOHAvtbGNlFiwBCIpzo6HWoGxKcgouFyBsxvBvGICTDaRqtQiQNtUsBS6KB3wATtuA/KITGLdTHk4PcbiH95MtypHd+lx7iX6OP2OLnX6gIFDqFo4Xg+KJrdpDuEHgWIrQmfdl22K7Z2JfLzLcQaf/Gj9k5bOAywIjao7wrcJLn9e76tnkSp7BjYCAP6aCrpYZ2Jnmfeki0f1RcNztzS9c9eAAWI1HGFLseUCP81qa6Psam+/fNXrdrDF/XWaYKgEzYSdrblZzzcMTN/RI7doiXaZA80QPBGpQC9Dh3TfMKhoyXRtAcY9RC/mFwcPLlFJCmErVVKEuht3e+dLGalW6KTLjClZcYaA=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c661b-f08a-4184-9b63-08dafb3c3ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 23:15:39.7026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxzlw1eVmfWXwtZ2qJ4ZAG+YlGFot5zK8Q3zncCiu+4PO4NaICtn+BUSnrbnCm0eww5RZsIfGru2n+M57/uOWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949
X-Proofpoint-GUID: 6GjxT7bJlQWzDZ88sUtY1ko61Mhn__LP
X-Proofpoint-ORIG-GUID: 6GjxT7bJlQWzDZ88sUtY1ko61Mhn__LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_11,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=844
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301200223
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCBKYW4gMTgsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiAxLzE0LzIw
MjMgNzoxNiBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIEZyaSwgSmFuIDEzLCAyMDIz
LCBMaW55dSBZdWFuIHdyb3RlOg0KPiA+ID4gT24gMS8xMy8yMDIzIDE6MjQgUE0sIFRoaW5oIE5n
dXllbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBXaGlsZSBzb21lIHBvbGxpbmcgbnVtYmVycyBz
ZWVtIGxhcmdlLCB3ZSBzaG91bGQgbm90IHJlbW92ZSB0aGUgdHJhY2luZw0KPiA+ID4gPiA+ID4g
PiA+IGV2ZW50cyBkdXJpbmcgcG9sbGluZy4gVGhlcmUgYXJlIHVzZWZ1bCBpbmZvIGluIHRoZSBz
dGF0dXMgcmVnaXN0ZXIgd2hlbg0KPiA+ID4gPiA+ID4gPiA+IHRoZXJlJ3MgYSB0aW1lb3V0LiBB
bHNvLCB0aGUgbnVtYmVyIG9mIHBvbGxzIG5lZWRlZCBmb3IgY2VydGFpbiBzdGF0ZQ0KPiA+ID4g
PiA+ID4gPiA+IGNoYW5nZSBpcyB1c2VmdWwgZGF0YSBwb2ludCBmb3IgZGVidWcuDQo+ID4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gV2hhdCB3ZSBtYXkgd2FudCB0byB1cGRhdGUgaXMg
bm90IGRlcGVuZCBvbiB0aGUgcmVnaXN0ZXIgcmVhZCBkZWxheSBmb3INCj4gPiA+ID4gPiA+ID4g
PiB0aGUgcG9sbGluZyBkdXJhdGlvbi4gRGlmZmVyZW50IHNldHVwIHdpbGwgaGF2ZSBkaWZmZXJl
bnQgZGVsYXkuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gSWYgd2Ugd2FudCB0
byBkaXNhYmxlIGl0IGZvciBkZWJ1Z2dpbmcgcHVycG9zZSwgbWFrZSBzdXJlIHRvIGhhdmUgdGhl
DQo+ID4gPiA+ID4gPiA+ID4gZGVmYXVsdCBvcHRpb24gYXMgZW5hYmxlZC4NCj4gPiA+ID4gPiA+
ID4gaWYgc28sIGRvIHlvdSBhY2NlcHQgZGVmaW5lIGEgbmV3IGZ1bmN0aW9uIGFuZCBuZXcgdHJh
Y2UgZXZlbnQgbGlrZSwNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IHN0YXRpYyBpbmxp
bmUgdTMyIGR3YzNfcmVhZGxfdGltZW91dCh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBvZmZzZXQp
DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBERUZJTkVfRVZFTlQoZHdjM19sb2dfaW8s
IGR3YzNfcmVhZGxfdGltZW91dCwNCj4gPiA+ID4gPiA+ID4gICAgwqDCoCDCoFRQX1BST1RPKHZv
aWQgX19pb21lbSAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gPiA+ID4gPiA+ID4g
ICAgwqDCoCDCoFRQX0FSR1MoYmFzZSwgb2Zmc2V0LCB2YWx1ZSkNCj4gPiA+ID4gPiA+ID4gKTsN
Cj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IGxldCB1c2VyIGVuYWJsZSBpdCBhY2NvcmRp
bmdseS4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBXZSBjYW4ganVzdCByZWRlZmluZSB0
aGUgZXZlbnQgd2l0aCBhbiBhZGRpdGlvbmFsIHBhcmFtZXRlciBmb3IgZXZlbnQNCj4gPiA+ID4g
PiA+IGZpbHRlcmluZyBvcHRpb24uDQo+ID4gPiA+ID4gYWN0dWFsbHkgZmlsdGVyaW5nIG9wdGlv
biBvbmx5IHdvcmsgYXQgZXZlbnQgb3V0cHV0IHRpbWUswqAgaXQgd2lsbCBzaG93IGRhdGENCj4g
PiA+ID4gPiBtYXRjaCBmaWx0ZXIsIGlnbm9yZSBkYXRhIHdoaWNoIG5vdCBtYXRjaC4NCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiB0aGVyZSBpcyBzdGlsbCBubyBmaWx0ZXIgd2hpY2ggcnVuIGJlZm9y
ZSBldmVudCBzYXZlIGJ1ZmZlciwgZXZlbnQgc3RpbGwNCj4gPiA+ID4gPiBzYXZlIGludG8gYnVm
ZmVyLA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGlmIHJlYWQgaGFwcGVuIHRvbyBtYW55IHRpbWVz
LCBpdCB3aWxsIGZsdXNoIHVzZWZ1bCBldmVudCBsaWtlIHdyaXRlDQo+ID4gPiA+ID4gcmVnaXN0
ZXIgb3BlcmF0aW9uLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiBPay4gV2hhdCBkbyB5b3UgdGhpbmsg
b2YgYWxzbyByZXZpdmluZyBKdW4ncyBjaGFuZ2UgdG8gdXNpbmcNCj4gPiA+ID4gcmVhZGxfcG9s
bF90aW1lb3V0X2F0b21pYz8gSXQgbWFrZXMgc2Vuc2UgdG8gY3JlYXRlIGEgbmV3IHRyYWNlIGV2
ZW50DQo+ID4gPiA+IGluIGFkZGl0aW9uIHRvIHRoYXQ6DQo+ID4gPiA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvODdibG15bXds
ei5mc2ZAa2VybmVsLm9yZy9ULyp0X187SXchIUE0RjJSOUdfcGchYmdlTjRNcDlodjJiMzNCcEo3
UVJBWEFkbS12Z2FmZ3VyeFhQLVlTZFFzZFdNWmtORlhuV1Y0cVhOVDRpQ1R6XzBtTE1IeWx3Nlo4
NEo1SVZQWVpucm9qNWVpTlFudyQNCj4gPiA+IA0KPiA+ID4gMS5pZiB5b3UgcmV2aWV3IGFsbCBw
bGFjZXMgd2hpY2ggcmVhZCBpbiB0aGlzIHdheSwgbm90IGFsbCBvZiB0aGVtIGNhbg0KPiA+ID4g
Y29udmVydCB0bw0KPiA+ID4gDQo+ID4gPiByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKCkgSnVu
IGludHJvZHVjZS4NCj4gPiA+IA0KPiA+IHdoaWNoIG9uZXM/DQo+IA0KPiANCj4gSSB0cnkgaXQg
YmVmb3JlLCBidXQgaWYgc3RyaWN0bHkgZm9sbG93IG9yaWdpbmFsIGNvZGUgbG9naWMsIGl0IGlz
IGhhcmQgdG8NCj4gY29udmVydCBhbGwgb2YgdGhlbSwgZS5nLsKgIGR3YzNfdWxwaV9idXN5bG9v
cCgpLg0KPiANCg0KV2hhdCdzIHRoZSBwcm9ibGVtIHdpdGggdGhhdCBvbmU/IEFsc28sIHdlJ3Jl
IG5vdCBleGFjdGx5IGZvbGxvd2luZyB0aGUNCm9yaWdpbmFsIGNvZGUgbG9naWMuIFRoZSBjdXJy
ZW50IGxvZ2ljIGRvZXNuJ3QgZW5zdXJlDQpjb25zaXN0ZW50L2RldGVybWluYXRlIHBvbGxpbmcg
ZHVyYXRpb24gYmV0d2VlbiBkaWZmZXJlbnQgc2V0dXAsIGFuZA0Ka2VlcGluZyBpdCBjb25zaXN0
ZW50IGlzIGEgZ29vZCB0aGluZy4NCg0KSnVzdCBuZWVkIHRvIG1ha2Ugc3VyZSB0byB1c2UgdGhl
IGFwcHJvcHJpYXRlIGF0b21pYy9ub24tYXRvbWljIHZlcnNpb24NCm9mIHRoZSByZWFkbF9wb2xs
X3RpbWVvdXQgd2hlcmUgaXQgY2FuIHNsZWVwIG9yIG5vdC4NCg0KVGhhbmtzLA0KVGhpbmg=
