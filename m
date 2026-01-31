Return-Path: <linux-usb+bounces-32959-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hr9IIInfmmLWAIAu9opvQ
	(envelope-from <linux-usb+bounces-32959-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:02:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA26AC2E12
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F06E3009B2C
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 16:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419F93382C5;
	Sat, 31 Jan 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQImXeIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tt7Y4f5V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3B29B216
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875282; cv=none; b=Xw9ETbzywwrPcqG3ClvOq/P9nFT7g5n8Dc93m2weqy4q27DvJT6jWMa3I1XZaHZuO04uhFl8CB9uJG/LC80uWDciEoJ3RDlr/VrKA3GeDc1IGuCj02qBfd4h16dhXTJ66SJjqEaEDkbASpttGqcI/iKJvD5mvWb5AhYPX6iPL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875282; c=relaxed/simple;
	bh=B4GYlTDYkxlCvfwOe4c/uxpLzlH7/1rqkKrEc+1yfVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DPY3v+DDqEA+YW7R2VimlEadiGaO3yXT6AReobcJkQag+XNEiO7XSLQMOS9zB+RAnI5+7Fsc8gLlT6Ag/oEkZKY8pfuigzGEAutI5SA1gsJ84ysnXK8lxYJdIm5PqsT0OTiye9YlFUfK0ixhOKkdDjI8v9RmPNHV8sOFA9xBSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQImXeIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tt7Y4f5V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4Twj2447706
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mbVNHKkciAHL9hX0+chMBzHZ3Vj3y8j4shS
	3uq4Igig=; b=HQImXeITis6AWcHhxQq9vWp7GLveweLzxoQ8rC7PLKe7E3enb8+
	VVZMNXGZD9NSoXv6+YiflaXDdh2pVf5qjV/qTLSLg5AQBQZrw1fV2HZTr3l7QdGQ
	bbIv0vXHRm3Of0rihKr9S9AW5Tc9gjMGMvk261Sj7PGw3dAtF64ZXIFrdHKd7zjU
	LumPilVco7ctlvLvJVCah326YWcU2ou3wzvZD4/Oy0+v66Jc+gfedOmmG4cKo7cJ
	+/PTpe9ovY+VoMWscgLWKOwecTy8LQlMwWYoU85HyVxAav/E2EJv7Y7FFYefIH5o
	+1n5t1UFRvJy7NaG4n7RusMRai5M4Xa4rOA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0s35f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:01:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so34329885ad.1
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769875280; x=1770480080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbVNHKkciAHL9hX0+chMBzHZ3Vj3y8j4shS3uq4Igig=;
        b=Tt7Y4f5VNJrrUaqsAkSBTepB4qRPsnRCCTTSFtw/1FO5h657jFYe0pul+X+NY3XKVw
         1B7oYlefSh/ul0rWFgGoJblm+GuZEw2fFMmNlYSY+oP1QE+q4kVqi/ZmebJ48OqMOb4R
         A7JiviKzMGRwgPL3XH8lIO9kjZ5AO6TQkFsgqD/aNIH/A//nkvTQM15IFrmhKYbywz7o
         sA7/YagDivye2DWF6MupmfhSttnwDDWUdvxg77LkNpTzFm4nZG/gal9ZkncCs0xUIOEM
         susY4HZaHvLutVxGGOUicp+aqDEy7cH1QBSuNp/vwJziZd7K2kXrEDUz/PtFNNuHRj+s
         0MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875280; x=1770480080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbVNHKkciAHL9hX0+chMBzHZ3Vj3y8j4shS3uq4Igig=;
        b=etBVDXCgTPkFL81D1O52A3/UqQxr4ZgJgoIPNssNk+iMVJEf2261U435eyV312C3+2
         CGjNJkhL+VOWeTcvgcpASOE5Vw0DO1fj/DnNbZjZs8Bf47ok3v87Zj5s/DzuF1MIWwzZ
         V49Mv7pJ2VvRyze7cuYiW6RuqHXtim4u10PAyo+R8lerGQ+nRhJjkQX1b+azA3D8E0pW
         afemDwirU8ZIYfAjiyxRWFIt8tzn3dSwFZLRLxaGKOX+6V+NyGlRlwvW/B+w2Ye+MPX+
         20+didEQ4Mv4x40+jtLlQ//Y8MUuVCe/MVju3SK/0ssc0BSrWwZeoTLRAnfTKCqRK1aq
         HJdw==
X-Gm-Message-State: AOJu0YyhUVgDhqiVGzfCd3bvN9VfXd1LZRBYo39cGKblqXAJOoVLhvJa
	BwpnrFC2TEdy2sZ5vMOSQs2Pes4LSgHPNhR1UlenLhA+o2dIx0h/wvoIksJS5oOeLzDcCLt7uLP
	Rav+oP5S2/5DqT11q6qVzIodVrtd853rjrlh6ng0FcZMsDs4NWgyP71tJl9+bLx0=
X-Gm-Gg: AZuq6aIv0ga9fRhpFiFfiBpWDJH4IyxNXWKdetdARih7qZdqVibSGDkj5+z3lW1t/oJ
	7D2rL2CVo55C4nZEt5iHfWlW6ZKAw1jGo/8ffBg2qoFNFhhJYI9KKhVWqkYnKKf8iclKmn422KA
	9rmLXo3KWLoxF1MZ5UoxJGWh0V1WyAilZ6Ep42RxKsBZ7xVworLFrs6q42qm7Ou4Lfe9RDXc+eD
	m9a25GIciNsf1dQqAI3bOkzUpCTol5mz35gwwvrK0g1IaBtuHjX9Yed7Vk7tm9D2zwJRJrauv2b
	YRV+u1NqjMujLb7Gcr2qgBgJBwW8H9oS8E/VStK2A8NHYDjjuKDRS66BG6jVYuFzi5wtfPxPn3D
	IP5CNW+Y9FcHL6hPYfQvveKVtq+RD5qeAwwCehc89PVj8CNo=
X-Received: by 2002:a17:903:3bc5:b0:2a7:80bf:3125 with SMTP id d9443c01a7336-2a8d98f488cmr72907055ad.13.1769875279898;
        Sat, 31 Jan 2026 08:01:19 -0800 (PST)
X-Received: by 2002:a17:903:3bc5:b0:2a7:80bf:3125 with SMTP id d9443c01a7336-2a8d98f488cmr72906635ad.13.1769875279264;
        Sat, 31 Jan 2026 08:01:19 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd7654dasm77358295ad.81.2026.01.31.08.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:01:18 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>,
        Christian Brauner <brauner@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
        Mateusz Guzik <mjguzik@gmail.com>, Liang Jie <liangjie@lixiang.com>,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>,
        Owen Gu <guhuinan@xiaomi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: gadget: Use sysfs_emit instead of sprintf
Date: Sat, 31 Jan 2026 21:31:09 +0530
Message-Id: <20260131160111.3161630-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEzNCBTYWx0ZWRfXziXCb1CpIABt
 4jGIaaizRZMzvAu9ZXj96Kk+xniupawa3v2ui8eoqYzbDrXfvdlbKg8LsLoiTot/7J6gDgzZ8d5
 x1ywk6OCPAivKzG2k/CNOWzhYkhet5sMNy8ooDP9Vp4lDWXWzlOTZFs+BvRWLytNMnCWilqTJmp
 vAPBLl1hDTvs25zTzlVoKxYDCnoF7+b7DjWLn9tX+8mc33lxavE6d9Q4vU7GGwW9hpNwz8XmOmn
 kvAS/18KQgvbkMdj2zd4tmGi2FTJe0c+j/2VrektjQNsISKmAMs8jgoQmRvPNigjPQpuWtcJP9e
 gTx984nG1yvxevRKbicyDcJQgYuqjsiezFg1TzkL+8+XprYyUgyI3jwxLx8DoXY8mWv9Wpo77Sf
 AqdusD7YnnfUuMzLhrFkbyhdbRfrc0eKQvwELaaJyHcT5UgsPGDWYDs1eDg/7Mgf7H1mRlhwWj1
 yCw3ioqzAV4OdmGqjCg==
X-Proofpoint-ORIG-GUID: R5sLzaMooZa4W3YZ76RNDp_sdOvUqpqH
X-Proofpoint-GUID: R5sLzaMooZa4W3YZ76RNDp_sdOvUqpqH
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697e2750 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ds8rhIrxm6W19G1CM2kA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-32959-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,zeniv.linux.org.uk,samcday.com,kernel.org,iscas.ac.cn,gmail.com,lixiang.com,lauterbach.com,xiaomi.com,wanadoo.fr];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA26AC2E12
X-Rspamd-Action: no action

Use sysfs_emit() instead of sprintf() in configfs attribute show functions.
sysfs_emit() is the recommended API for sysfs output as it provides buffer
overflow protection and proper formatting.

Krishna Kurapati (2):
  usb: gadget: f_fs: Use sysfs_emit() in configfs show function
  usb: gadget: f_sourcesink: Use sysfs_emit() in configfs show functions

 drivers/usb/gadget/function/f_fs.c         |  2 +-
 drivers/usb/gadget/function/f_sourcesink.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1


