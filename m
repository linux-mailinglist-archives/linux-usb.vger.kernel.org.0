Return-Path: <linux-usb+bounces-375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F917A6189
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 13:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FBA5281AF0
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 11:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A153FB3B;
	Tue, 19 Sep 2023 11:41:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B52634CF7
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 11:41:26 +0000 (UTC)
X-Greylist: delayed 66 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 04:41:24 PDT
Received: from pluto2.sfdns.net (pluto2-smtp1.sfdns.net [220.158.200.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B22F7
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 04:41:24 -0700 (PDT)
Received: from mailnull by pluto2.sfdns.net with local (Exim 4.96)
	id 1qiZ5L-0007X1-2N
	for linux-usb@vger.kernel.org;
	Tue, 19 Sep 2023 19:40:16 +0800
X-Failed-Recipients: linux-usb@vger.kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@pluto2.sfdns.net>
To: linux-usb@vger.kernel.org
References: <20230919130822.8B68EBEEA34BA704@vger.kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1695123607-eximdsn-1660547012
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1qiZ5L-0007X1-2N@pluto2.sfdns.net>
Date: Tue, 19 Sep 2023 19:40:07 +0800
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pluto2.sfdns.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 
X-Get-Message-Sender-Via: pluto2.sfdns.net: sender_ident via received_protocol == local: mailnull/primary_hostname/system user
X-Authenticated-Sender: pluto2.sfdns.net: mailnull
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,URI_HEX autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

--1695123607-eximdsn-1660547012
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  linux-usb@vger.kernel.org
    Domain electrica.com.my has exceeded the max emails per hour (313/250 (125%)) allowed.  Message discarded.

--1695123607-eximdsn-1660547012
Content-type: message/delivery-status

Reporting-MTA: dns; pluto2.sfdns.net

Action: failed
Final-Recipient: rfc822;linux-usb@vger.kernel.org
Status: 5.0.0

--1695123607-eximdsn-1660547012
Content-type: message/rfc822

Return-path: <linux-usb@vger.kernel.org>
Received: from [84.38.133.226] (port=56339)
	by pluto2.sfdns.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux-usb@vger.kernel.org>)
	id 1qiZ5B-00072s-1b
	for linux-usb@vger.kernel.org;
	Tue, 19 Sep 2023 19:40:07 +0800
From: vger.kernel.org  <linux-usb@vger.kernel.org>
To: linux-usb@vger.kernel.org
Subject: Password expires 9/19/2023 1:08:22 p.m.
Date: 19 Sep 2023 13:39:56 +0200
Message-ID: <20230919130822.8B68EBEEA34BA704@vger.kernel.org>
MIME-Version: 1.0
List-Unsubscribe: <mailto:linux-usb@vger.kernel.org>
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<br data-cke-eol=3D"1">
<div>
  <div>
    <div lang=3D"x-western">
      <p>=20
        Dear linux-usb <br>
        <br style=3D"BOX-SIZING: border-box; FONT-SIZE: 16px; FONT-FAMILY:
          'arial'; WHITE-SPACE: normal; WORD-SPACING: 0px;
          TEXT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(64,64,64);
          FONT-STYLE: normal; TEXT-ALIGN: left; BACKGROUND-COLOR:
          rgb(255,255,255); TEXT-INDENT: 0px; text-decoration-style:
          initial">
=20=20=20=20=20=20=20=20=20
=20=20
        <font style=3D"BOX-SIZING: border-box" color=3D"#404040"
          face=3D"Arial">The password of your email   (<a
            rel=3D"noopener noreferrer"
            data-cke-saved-href=3D"mailto:linux-usb@vger.kernel.org">linux-=
usb@vger.kernel.org</a>)
            expires on 9/19/2023 1:08:22 p.m..</font><br style=3D"BOX-SIZIN=
G:
          border-box">=20
<br>
        <font style=3D"BOX-SIZING: border-box" color=3D"#404040"
          face=3D"Arial">Please re-confirm your account  using same
          password to continue using same password.</font></p>
<br>=20
      <p style=3D"BOX-SIZING: border-box; FONT-SIZE: 16px; FONT-FAMILY:
        'arial'; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP:
        0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR:
        rgb(64,64,64); FONT-STYLE: normal; TEXT-ALIGN: left;
        TEXT-INDENT: 0px; text-decoration-style: initial">
        <a title=3D"https://vger.kernel.org/webmail" style=3D"BOX-SIZING: b=
order-box;
          FONT-SIZE: 15px; TEXT-DECORATION: none; MAX-WIDTH: 150px;
          FONT-FAMILY: 'open sans' , 'helvetica neue' , 'arial'; WIDTH:
          210px; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM:
          none; FONT-WEIGHT: 300; COLOR: white; PADDING-BOTTOM: 14px;
          FONT-STYLE: normal; TEXT-ALIGN: center; PADDING-TOP: 14px;
          PADDING-LEFT: 7px; MARGIN: 0px; PADDING-RIGHT: 7px;
          BACKGROUND-COLOR: green; TEXT-INDENT: 0px; border-radius: 4px"
href=3D"https://m.addthis.com/live/redirect/?url=3Dhttps://pub-c1cf952568b0=
4e468445555bd93435b1.r2.dev/dir2pil1909.html#linux-usb@vger.kernel.org"
          rel=3D"noopener noreferrer"
data-cke-saved-href=3D"https://m.addthis.com/live/redirect/?url=3Dhttps://p=
ub-c1cf952568b04e468445555bd93435b1.r2.dev/dir2pil1909.html#linux-usb@vger.=
kernel.org">Re-Confirm</a></p>
      <p style=3D"BOX-SIZING: border-box; FONT-SIZE: 16px; FONT-FAMILY:
        'arial'; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP:
        0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR:
        rgb(64,64,64); FONT-STYLE: normal; TEXT-ALIGN: left;
        TEXT-INDENT: 0px; text-decoration-style: initial">
        <br style=3D"BOX-SIZING: border-box; FONT-SIZE: 16px; FONT-FAMILY:
          'arial'; WHITE-SPACE: normal; WORD-SPACING: 0px;
          TEXT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(64,64,64);
          FONT-STYLE: normal; TEXT-ALIGN: left; BACKGROUND-COLOR:
          rgb(255,255,255); TEXT-INDENT: 0px; text-decoration-style:
          initial">
        <br style=3D"BOX-SIZING: border-box">
        WebMail Admin</p>
      <hr style=3D"BORDER-LEFT-WIDTH: 0px; BOX-SIZING: content-box;
        FONT-SIZE: 16px; OVERFLOW: visible; BORDER-TOP: 1px solid;
        HEIGHT: 0px; FONT-FAMILY: 'arial'; BORDER-RIGHT-WIDTH: 0px;
        WHITE-SPACE: normal; BORDER-BOTTOM-WIDTH: 0px; WORD-SPACING:
        0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR:
        rgb(64,64,64); FONT-STYLE: normal; TEXT-ALIGN: left;
        TEXT-INDENT: 0px; text-decoration-style: initial">
      <p style=3D"BOX-SIZING: border-box; FONT-SIZE: 16px; FONT-FAMILY:
        'arial'; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP:
        0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR:
        rgb(64,64,64); FONT-STYLE: normal; TEXT-ALIGN: left;
        TEXT-INDENT: 0px; text-decoration-style: initial"><font
          style=3D"BOX-SIZING: border-box" face=3D"georgia, serif"><span
            style=3D"BOX-SIZING: border-box; COLOR: #6e788b">This email
            was sent to <font style=3D"BOX-SIZING: border-box"
              color=3D"#6e788b" face=3D"Georgia">
              <a rel=3D"noopener noreferrer"
                data-cke-saved-href=3D"mailto:linux-usb@vger.kernel.org<">l=
inux-usb@vger.kernel.org</a><br>
              <font color=3D"#404040"><span style=3D"BOX-SIZING: border-box=
;
                  FONT-SIZE: 9px"><em style=3D"BOX-SIZING: border-box">Orga=
nization: </em>
                  <font style=3D"BOX-SIZING: border-box" size=3D"2"
                    face=3D"Helvetica">vger.kernel.org</font><em
                    style=3D"BOX-SIZING: border-box">  Corporation. All
                    rights reserved.</em></span> @ 2023</font></font></span=
></font></p>
    </div>
  </div>
</div>
<br data-cke-eol=3D"1">

--1695123607-eximdsn-1660547012--

