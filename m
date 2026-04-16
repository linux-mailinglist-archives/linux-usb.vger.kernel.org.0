Return-Path: <linux-usb+bounces-36268-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE8TAh1Z4GmGfQAAu9opvQ
	(envelope-from <linux-usb+bounces-36268-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 05:35:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA487409FB6
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 05:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F9823045548
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 03:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411FC2D12EE;
	Thu, 16 Apr 2026 03:27:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from r9221.ps.combzmail.jp (r9221.ps.combzmail.jp [160.16.65.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ED520C029
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 03:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.65.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776310037; cv=none; b=DRuXG4XLsw2rEJUPW6FxYUP52xmS3ScOXv4KKJyU6vyp5CYhUGfQo2KURRRLTYOdgVMuzjD+X7XbeQ+7hbefSjPCTJzP0VYXu/Cezp9hL+kLULmPDukmKRgQT6o3UvGpcPVbcKg3svY95EjJk5YR6Wale9mYmG2gej6It3wEF80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776310037; c=relaxed/simple;
	bh=dDkk4mnzfHKJldzPmvzDMe22JbYrxd2TLEafe2IUTJI=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=C2pjUn7sbVyJisQaWlkVQIB1HASNJeRTtBbSEURWBNUeTbq363NbFPbKbm5LnRlI3Po6W+BpQkpz6W+obXP5d5ZSEGD/PBrBOkc5oneDsReqyhfrW9lKiKMiF5W6/xG/5jQkJvQ/1u41FB4/JJ9aH4q5SHuDVK/4IKQCCpm7+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=160.16.65.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=knowledge-seminar.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9221.ps.combzmail.jp (Postfix, from userid 99)
	id 5AD76E4A22; Thu, 16 Apr 2026 12:14:27 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9221.ps.combzmail.jp 5AD76E4A22
To: linux-usb@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCP0BFRCE/JUolbCVDJTglaiVzJS8bKEI=?= <info@knowledge-seminar.jp>
X-Ip: 3521611178903516
X-Ip-source: k85gj72848dnsad1u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCPFJEOSROGyhCTkcbJEI5VEYwGyhC?=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 28d1
X-uId: 6764255440486060694174711047
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20260416031538.5AD76E4A22@r9221.ps.combzmail.jp>
Date: Thu, 16 Apr 2026 12:14:27 +0900 (JST)
X-Spamd-Result: default: False [12.33 / 15.00];
	FUZZY_DENIED(11.99)[1:551c17fa6f:1.00:txt];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[knowledge-seminar.jp];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ASN_FAIL(0.00)[74.135.232.172.asn.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-36268-lists,linux-usb=lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.643];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@knowledge-seminar.jp,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fc-knowledgelink-corp.jp:url,knowledge-corp.jp:url]
X-Rspamd-Queue-Id: AA487409FB6
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

　お世話になります。ナレッジリンクセミナー事務局です。
　
　
　「社員のモチベーションを上げようと声をかける」
　「部下の相談に乗り、一緒に悩んであげる」
　「現場のトラブルに、自ら先頭に立って対応する」
　
　もし社長がこれらを率先しているようであれば、
　残念ながら、その組織の成長はそこで止まります。
　
　社長のその“優しさ”が、社員の甘えを生み、責任感を奪い、
　「指示待ち人間」を量産する装置になっているからです。
　
　
　4,800社の経営者が衝撃を受けた、
　良かれと思ってやってしまう「社長のNG行動」の正体。
　
　組織を劇的に変えるための、
　オンラインセミナーを開催いたします。
　
　1つでも心当たりがあれば、一度ご視聴ください。　
　
　>>視聴予約はこちら
　https://knowledge-corp.jp/shikigaku5/
　
----------------------------------------------
　
　テーマ ：　それ、危険です 『社長のNG行動』
　　　　　 〜 その行動が、組織崩壊を招く 〜
　

　日 程　： 4月21日（火）13:00スタート　※残11席
　　　　　  5月19日（火）13:00スタート
　　　　　※どちらの日程も内容は同じ
　会 場　：Zoom開催
　定 員　：先着100名（費用は不要）
----------------------------------------------
　※経営層の方限定です
　
　
　なぜ、社員は「言われたこと」しかやらないのか。
　なぜ、次世代のリーダー候補が育たないのか。
　
　それは、能力の問題ではなく、
　
　良かれと思って続けている「社長の配慮」こそが、
　組織成長を止める、最大のボトルネックかもしれません。
　
　本セミナーでは、4,800社以上が導入した
　独自の組織論「識学」に基づき、社長の「NG行動」と
　真の経営者へ脱皮するためのマインドセットを伝授します。
　
　
　【セミナー内容(一部抜粋)】
　 ○ NG行動3選
　 ○ なぜ優秀なNo.2や部長が育たないのか
　 ○ マネジメントスタイルの変革について
　 ○ 導入企業の事例
　
　「管理職が育ったら任せる」ではなく「任せるから育つ」
　という思考の逆転を提言。
　
　現場から「冷たくなった」と思われることを恐れず、
　機能的な階層構造（仕組み）を作ることで

　結果として社員全員を守り、
　利益を最大化させる道筋を明示します。

　「優しさ」で人を動かすのではなく、
　「正しさ」で組織を動かす。

　音声やお顔が表に出ることはございませんので
　お気軽にご視聴ください。
　
　>>視聴予約はこちら
　https://knowledge-corp.jp/shikigaku5/
　
　
-----------------------
　一般社団法人 ナレッジリンク
　東京都千代田区神田小川町1-8-3
　電話：03-5256-7638

　セミナーのご案内が不要な方は大変残念ではございますが、
　下記URLより手続き下さいませ。
　
　メール配信のワンクリック解除はこちら
　https://fc-knowledgelink-corp.jp/mail/
　

